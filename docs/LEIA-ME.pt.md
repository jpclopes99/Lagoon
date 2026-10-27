# Lagoon — resumo em português

Versão curta do [README](../README.md) (que está em inglês), para leres depressa.

## O que é

Uma "Dynamic Island" grátis para o notch do Mac (ou o topo de qualquer ecrã sem notch). Fechada, mostra o que está a acontecer agora: música, timer, chamada, notificação. Ao passar o rato abre um painel maior, uma **Lagoon**, onde controlas tudo sem sair do que estás a fazer. Feita em Swift/SwiftUI, com aspeto preto ou Liquid Glass, e com um **Marketplace de plugins**.

## Como instalar

Abre o **Terminal** e cola:

```bash
curl -fsSL https://raw.githubusercontent.com/jpclopes99/Lagoon/main/install.sh | bash
```

- O comando descarrega a última versão, põe a Lagoon em Aplicações e abre-a.
- **Atualizações:** a Lagoon atualiza-se sozinha. Procura versões novas ao abrir, ao desbloquear o Mac e uma vez por dia; quando há uma, aparece um aviso na ilha (e no Centro de Notificações) com o botão **Instalar**. As definições, as permissões e os plugins ficam. Também há "Procurar atualizações…" no ícone da barra de menus e em Definições → Geral → Atualizações.
- **À mão:** descarrega o `Lagoon.zip` da [última versão](https://github.com/jpclopes99/Lagoon/releases/latest) e arrasta a Lagoon para Aplicações. Na primeira vez o macOS diz que não consegue verificar o programador: vai a **Definições do Sistema → Privacidade e Segurança → Abrir mesmo assim** (só uma vez).
- Precisa de macOS 14 ou mais recente. O Liquid Glass precisa de macOS 26.
- A app fica na barra de menus, sem ícone na Dock. "Abrir ao iniciar sessão" está em Definições → Geral.

## Como se usa

- **Ilha fechada:** mostra a atividade atual. As outras atividades ficam em bolhas ao lado (1 a 6).
- **Abrir:** passar o rato ou clicar. Abre na atividade do meio; se não houver nenhuma, na última Lagoon que escolheste.
- **Barra das Lagoons:** em baixo na ilha aberta. As Lagoons que não cabem ficam na página •••.
- **Deslizar com dois dedos** muda de Lagoon.
- **Botão direito** na ilha: vinil, mostrar ou esconder o widget da música e Definições.

## Lagoons principais

- **Música:**
  - Leitores: qualquer leitor (Spotify, Music, YouTube Music e browsers como Chrome, Safari…).
  - Controlos: fila, recentes, gosto do Spotify, saída de áudio, volume e lista de leitores.
  - Capa: normal ou em vinil. O README tem imagens das duas.
- **Calendário:** semana, eventos, lembretes e aviso de reunião com o botão "Join".
- **Timers:** régua e vários timers ao mesmo tempo. ⌥⌘T ou ⌘ + clique no notch inicia um timer rápido.
- **Stay Awake:** mantém o Mac acordado (⌥⌘A).
- **Gravar:** grava o ecrã (⌥⌘R).
- **Outros:** Meteorologia, Notificações (com resposta rápida), Clip (prateleira de ficheiros), Clipboard (⌥⌘V), Dispositivos (baterias), Câmara, Chamada (Teams/Zoom), Transferências, Agentes, Terminal, Áudio por app, Sistema e Shortcuts.

## Largar ficheiros no notch

Aparecem 4 destinos:
- **Clip:** guardar na prateleira.
- **Converter:** imagens, áudio, vídeo, PDF, documentos e ZIP, tudo sem internet.
- **AirDrop:** enviar.
- **iCloud:** enviar e copiar o link.

## Plugins

Estão em Definições → Plugins, com os separadores Instalados e Marketplace:

- **Action Ring:** anel de ações à volta do cursor (⌥⇥).
- **Shortcuts:** apps e links favoritos.
- **Music Widget:** widget na secretária e leitor na barra de menus.
- **Stay Awake.**
- **Pomodoro.**
- **Window Snap:** organizar janelas.
- **Termi-Notch:** comandos da shell.
- **Audio Control:** volume por app.
- **System Stats:** estado do Mac.
- **Agents:** Claude Code e Copilot. Para os limites do Claude, se o macOS pedir autorização, carrega em **Permitir acesso** no painel de utilização e escolhe **Permitir sempre** (a Lagoon nunca pede sozinha).
- **Teams** e **Zoom:** controlos de reunião.
- **Downloads** do Chrome, Safari e Firefox.

Também podes carregar um plugin teu (JavaScript) a partir de uma pasta, em Definições → Plugins.

## Spotify

O básico (tocar, pausar, avançar e a capa) funciona logo, sem configurar nada. O gosto, a fila, os recentes e o repetir uma música precisam de uma app do Spotify tua, grátis:

1. No [painel de programadores do Spotify](https://developer.spotify.com/dashboard), entra com a tua conta e carrega em **Create app**.
2. Dá-lhe um nome qualquer, marca **Web API** e, em **Redirect URIs**, põe exatamente `http://127.0.0.1:8957/callback`.
3. Copia o **Client ID**.
4. Na Lagoon, em Definições → Atividades → Spotify, cola o Client ID e carrega em **Ligar ao Spotify**.

O Spotify limita os pedidos que cada app pode fazer: se pedir para esperar, a ilha diz até que horas.

## Privacidade

Não há conta nem estatísticas de uso. Só sai informação do Mac para:
- a meteorologia (Open-Meteo);
- o Spotify;
- o ícone de cada link nos Shortcuts;
- os limites do Claude e do Copilot no plugin Agents (opcional).

Os logins ficam no Porta-chaves do macOS.

## Créditos

A Lagoon usa o mediaremote-adapter (BSD 3-Clause), o Sparkle (MIT) e os dados meteorológicos do Open-Meteo (CC BY 4.0). Os avisos completos estão na app, em Definições → Geral → Créditos e licenças.

## Sugestões e problemas

Qualquer pessoa pode abrir uma issue no GitHub para reportar um problema ou sugerir uma funcionalidade. As correções e novidades saem em novas versões.

## Licença

**Todos os direitos reservados** (ficheiro [LICENSE](../LICENSE)). Qualquer pessoa pode descarregar, instalar e usar a Lagoon de graça, mas não é open source: o código não é publicado e é proibido copiar, alterar ou distribuir a app sem autorização escrita do autor. Os componentes de terceiros não estão abrangidos por ela e mantêm as suas licenças: mediaremote-adapter (BSD 3-Clause) e Sparkle (MIT); os dados meteorológicos são do Open-Meteo (CC BY 4.0).
