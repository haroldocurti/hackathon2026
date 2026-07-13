param(
    [string]$Root = $PSScriptRoot
)

$ErrorActionPreference = 'Stop'

$pages = @(
    @{ File = 'cronograma.html'; Title = 'Cronograma mestre'; Eyebrow = 'Planejamento'; Description = 'Prazos, entregas, responsáveis, dependências e marcos de decisão até o pós-evento.'; Sources = @('cronograma-desenvolvimento.md') },
    @{ File = 'status.html'; Title = 'Status do projeto'; Eyebrow = 'Visão executiva'; Description = 'O que já foi consolidado, o que está em andamento e quais frentes precisam avançar.'; Sources = @('relatorio-status.md') },
    @{ File = 'mobilizacao-interna.html'; Title = 'Mobilização interna'; Eyebrow = 'Fase 2A'; Description = 'Estratégia para envolver docentes e equipes internas antes da divulgação para estudantes.'; Sources = @('mobilizacao-interna.md') },
    @{ File = 'projeto.html'; Title = 'Projeto Hackathon 2026'; Eyebrow = 'Proposta institucional'; Description = 'Manifesto, estrutura, públicos, entregas, avaliação e resultados esperados.'; Sources = @('Projeto Hackathon 2026.md') },
    @{ File = 'regulamento.html'; Title = 'Regulamento geral'; Eyebrow = 'Regras do evento'; Description = 'Elegibilidade, equipes, dinâmica, entregas, avaliação, premiação e conduta.'; Sources = @('regulamento.md') },
    @{ File = 'tarefas.html'; Title = 'Plano de tarefas'; Eyebrow = 'Acompanhamento'; Description = 'Checklist completo da organização, da estruturação pedagógica ao pós-evento.'; Sources = @('afazeres.md') },
    @{ File = 'trilhas.html'; Title = 'Trilhas de desafio'; Eyebrow = 'Conteúdo dos desafios'; Description = 'Conceitos, contextos locais, personas, perguntas norteadoras e referências das cinco trilhas.'; Sources = @('Desafios\trilha1-acessibilidade.md','Desafios\trilha2-trabalhabilidade.md','Desafios\trilha3-saude.md','Desafios\trilha4-sustentabilidade.md','Desafios\trilha5-diversidade.md') },
    @{ File = 'tematica.html'; Title = 'O Tear de Jacquard'; Eyebrow = 'Temática e engajamento'; Description = 'A narrativa oficial do evento, suas metáforas e estratégias de sensibilização.'; Sources = @('Temática\Tear-de-Jacquard.md','Temática\ideias-engajamento.md') },
    @{ File = 'fundamentos.html'; Title = 'Fundamentos pedagógicos'; Eyebrow = 'Jeito Senac de educar'; Description = 'Como planejamento, mediação, avaliação e marcas formativas orientam o Hackathon.'; Sources = @('fundamentos-pedagogicos.md') },
    @{ File = 'portal.html'; Title = 'Sobre esta central'; Eyebrow = 'Orientação do portal'; Description = 'Propósito, públicos, linguagem e decisões que orientam a evolução desta central.'; Sources = @('sobre-central.md') }
)

$nav = @(
    @{ File = 'index.html'; Label = 'Visão geral' },
    @{ File = 'status.html'; Label = 'Status' },
    @{ File = 'cronograma.html'; Label = 'Cronograma' },
    @{ File = 'projeto.html'; Label = 'Projeto' },
    @{ File = 'regulamento.html'; Label = 'Regulamento' },
    @{ File = 'trilhas.html'; Label = 'Trilhas' },
    @{ File = 'tarefas.html'; Label = 'Tarefas' }
)

function Get-Navigation([string]$CurrentFile) {
    return ($nav | ForEach-Object {
        $active = if ($_.File -eq $CurrentFile) { ' class="active" aria-current="page"' } else { '' }
        '<a href="{0}"{2}>{1}</a>' -f $_.File, $_.Label, $active
    }) -join "`n          "
}

function Update-InternalLinks([string]$Html) {
    $replacements = @(
        @{ Pattern = 'href="[^"]*cronograma-desenvolvimento\.md"'; Value = 'href="cronograma.html"' },
        @{ Pattern = 'href="[^"]*relatorio-status\.md"'; Value = 'href="status.html"' },
        @{ Pattern = 'href="[^"]*mobilizacao-interna\.md"'; Value = 'href="mobilizacao-interna.html"' },
        @{ Pattern = 'href="[^"]*afazeres\.md"'; Value = 'href="tarefas.html"' },
        @{ Pattern = 'href="[^"]*regulamento\.md"'; Value = 'href="regulamento.html"' },
        @{ Pattern = 'href="[^"]*Projeto(?:%20| )Hackathon(?:%20| )2026\.md"'; Value = 'href="projeto.html"' },
        @{ Pattern = 'href="[^"]*memoria-projeto-site\.md"'; Value = 'href="portal.html"' },
        @{ Pattern = 'href="file:///[^"]*/Desafios"'; Value = 'href="trilhas.html"' },
        @{ Pattern = 'href="[^"]*Tear-de-Jacquard\.md"'; Value = 'href="tematica.html"' },
        @{ Pattern = 'href="[^"]*ideias-engajamento\.md"'; Value = 'href="tematica.html#estrategias-de-engajamento-e-sensibilizacao-hackathon-2026"' },
        @{ Pattern = 'href="[^"]*trilha[1-5]-[^"/]+\.md"'; Value = 'href="trilhas.html"' }
    )
    foreach ($item in $replacements) {
        $Html = $Html -replace $item.Pattern, $item.Value
    }
    return $Html
}

function Get-PageContent([hashtable]$Page) {
    $sections = @()
    foreach ($source in $Page.Sources) {
        $path = Join-Path $Root $source
        $html = (ConvertFrom-Markdown -Path $path).Html
        if ($Page.Sources.Count -eq 1) {
            $html = $html -replace '(?s)^<h1[^>]*>.*?</h1>\s*', ''
        } else {
            $prefix = [IO.Path]::GetFileNameWithoutExtension($source).ToLowerInvariant()
            $prefix = $prefix.Normalize([Text.NormalizationForm]::FormD) -replace '\p{M}', '' -replace '[^a-z0-9]+', '-'
            $html = [regex]::Replace($html, 'id="([^"]+)"', { param($m) 'id="' + $prefix + '-' + $m.Groups[1].Value + '"' })
            $html = [regex]::Replace($html, 'href="#([^"]+)"', { param($m) 'href="#' + $prefix + '-' + $m.Groups[1].Value + '"' })
            $html = [regex]::Replace($html, '<h1[^>]*>', '<h2 id="' + $prefix + '" class="source-title">', 1)
            $html = [regex]::Replace($html, '</h1>', '</h2>', 1)
        }
        $sections += $html
    }
    $content = $sections -join "`n<hr class=`"source-divider`">`n"
    $content = Update-InternalLinks $content
    $content = [regex]::Replace($content, '<pre><code class="language-mermaid">.*?</code></pre>', '<div class="content-note"><strong>Cronograma visual</strong><p>A visão detalhada e atualizada está disponível na página do <a href="cronograma.html">cronograma mestre</a>.</p></div>', 'Singleline')
    $content = $content -replace '<table>', '<div class="table-scroll"><table>'
    $content = $content -replace '</table>', '</table></div>'
    return $content
}

function Get-TableOfContents([string]$Html) {
    $matches = [regex]::Matches($Html, '<h([23]) id="([^"]+)"[^>]*>(.*?)</h[23]>', 'Singleline')
    $links = foreach ($match in $matches) {
        $level = $match.Groups[1].Value
        $id = $match.Groups[2].Value
        $label = $match.Groups[3].Value -replace '<[^>]+>', ''
        $label = [System.Net.WebUtility]::HtmlDecode($label)
        $class = if ($level -eq '3') { ' class="toc-subitem"' } else { '' }
        '<a href="#{0}"{2}>{1}</a>' -f $id, $label, $class
    }
    return $links -join "`n              "
}

function Get-RelatedLinks([string]$CurrentFile) {
    $related = $pages | Where-Object { $_.File -ne $CurrentFile } | Select-Object -First 4
    return ($related | ForEach-Object {
        '<a href="{0}"><span>{1}</span><strong>{2}</strong></a>' -f $_.File, $_.Eyebrow, $_.Title
    }) -join "`n          "
}

foreach ($page in $pages) {
    $content = Get-PageContent $page
    $toc = Get-TableOfContents $content
    $navigation = Get-Navigation $page.File
    $related = Get-RelatedLinks $page.File
    $title = $page.Title
    $eyebrow = $page.Eyebrow
    $description = $page.Description

    $document = @"
<!doctype html>
<html lang="pt-BR">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="$description">
    <title>$title | Hackathon Senac Ribeirão Preto 2026</title>
    <link rel="stylesheet" href="styles.css">
  </head>
  <body class="content-page">
    <a class="skip-link" href="#conteudo">Ir para o conteúdo</a>
    <header class="topbar">
      <a class="brand" href="index.html" aria-label="Ir para a visão geral">
        <span class="brand-mark" aria-hidden="true">H</span>
        <span><strong>Hackathon 2026</strong><small>Central da organização</small></span>
      </a>
      <nav class="nav" aria-label="Navegação principal">
          $navigation
      </nav>
      <a class="topbar-action" href="index.html">Visão geral</a>
    </header>
    <main id="conteudo" class="page-main">
      <header class="page-hero">
        <div>
          <p class="eyebrow">$eyebrow</p>
          <h1>$title</h1>
          <p>$description</p>
        </div>
        <dl>
          <div><dt>Evento</dt><dd>6 e 7 de novembro</dd></div>
          <div><dt>Atualização</dt><dd>13 de julho de 2026</dd></div>
        </dl>
      </header>
      <div class="page-layout">
        <aside class="page-toc" aria-label="Nesta página">
          <span>Nesta página</span>
          <nav>$toc</nav>
        </aside>
        <article class="rich-content">
          $content
        </article>
      </div>
      <section class="related-pages" aria-labelledby="related-title">
        <p class="eyebrow">Continue consultando</p>
        <h2 id="related-title">Outras áreas da organização</h2>
        <div>$related</div>
      </section>
    </main>
    <footer>
      <div><strong>Hackathon Senac Ribeirão Preto 2026</strong><p>Não queremos apenas projetos. Queremos impacto.</p></div>
      <div><span>Conteúdo atualizado a partir dos documentos internos</span><strong>13 de julho de 2026</strong></div>
      <a href="portal.html">Sobre esta central</a>
    </footer>
  </body>
</html>
"@

    Set-Content -LiteralPath (Join-Path $Root $page.File) -Value $document -Encoding utf8
    Write-Output "Gerada: $($page.File)"
}
