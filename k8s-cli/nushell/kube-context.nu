def --env "kube ctx" [] {

    let color_normal = { fg: '#ffffff' bg: '#4b6584' attr: b }

    let tempConfigFileBaseDir = "/tmp/kube-context"
    if not ($tempConfigFileBaseDir | path exists ) { mkdir $tempConfigFileBaseDir }

    let configFiles = (ls ~/.kube/**/*config 
        | each { |file| 
            open $file.name 
            | from yaml 
            | each { |context| { context: $context.contexts.name, filePath: $file.name } }
          }
        | flatten 
    ) 

    let selectedContext = ($configFiles
        | each { |item|
            $"(ansi --escape $color_normal) ($item.context) (ansi reset)" + $'(ansi light_gray_dimmed)' + ' :: ' + $"($item.filePath)" + $'(ansi reset)'
          }
        | to text
        | gum filter --header "select kubernetes context" --placeholder "filter ..." --no-fuzzy --limit 1 --no-strip-ansi
    )

    let parsedString = $selectedContext | parse ' {context}  :: {filePath}' | first
    let context = $parsedString.context
    let filePath = $parsedString.filePath

    let configFile = $"($tempConfigFileBaseDir)/" + (random chars --length 40) + ".config"
    kubectl config view --flatten --minify --context $context -o yaml | save --force $configFile
    $env.KUBECONFIG = $"($configFile)"

    let configInfoFile = $configFile + ".info"
    { context: $context, filePath: $filePath, configFile: $configFile, date: (date now) } | to yaml | save --force $configInfoFile

    kube ns
}

def --env "kube ns" [] {

    let color_normal = { fg: '#ffffff' bg: '#4b6584' attr: b }
    let color_default = { fg: '#ffffff' bg: '#a55eea' attr: b }
    let color_system = { fg: '#ffffff' bg: '#fc5c65' attr: b }

    let namespaces = (kubectl get ns | detect columns | sort-by NAME
      | each { |item| { namespace: $item.NAME} }
    )

    let selectedNamespace = ($namespaces
        | each { |item|
            if ($item.namespace == 'default') {
                $"(ansi --escape $color_default) ($item.namespace) (ansi reset)"
            } else if ($item.namespace | str starts-with 'kube-') {
                $"(ansi --escape $color_system) ($item.namespace) (ansi reset)"
            } else {
                $"(ansi --escape $color_normal) ($item.namespace) (ansi reset)"
            }
          }
        | to text
        | gum filter --header "select kubernetes namepace" --placeholder "filter ..." --no-fuzzy --limit 1 --no-strip-ansi
    )

    kubectl config set-context --current --namespace ($selectedNamespace | str trim)
}