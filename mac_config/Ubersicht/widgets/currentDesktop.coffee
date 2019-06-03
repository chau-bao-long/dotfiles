command: "echo $(x=$(/usr/local/bin/chunkc tiling::query -d id);echo $(/usr/local/bin/chunkc tiling::query -D $(/usr/local/bin/chunkc tiling::query -m id))\",$x\")"

refreshFrequency: 1000

render: (output) ->
  values = output.split(',')
  spaces = values[0].split(' ')

  htmlString = """
    <div class="currentDesktop-container" data-count="#{spaces.length}">
      <ul>
  """

  for i in [0..spaces.length - 1]
    icon = ""
    switch spaces[i]
        when '1' then icon = "./assets/icons/code.svg"
        when '2' then icon = "./assets/icons/system-file-manager-symbolic.svg"
        when '3' then icon = "./assets/icons/firefox-symbolic.svg"
        when '5' then icon = "./assets/icons/multimedia-audio-player.svg"
        else icon = "./assets/icons/utilities-terminal-symbolic.svg"
    htmlString += "<li id=\"desktop#{spaces[i]}\"><img src=\"#{icon}\" /></li>"

  htmlString += """
      <ul>
    </div>
  """

style: """
  position: relative
  font: 14px "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif
  color: #aaa
  font-weight: 700

  ul
    list-style: none
    margin: 0 0 0 10px
    padding: 0

  li
    display: inline
    margin: 0 10px

    img
      max-height: 20px
      max-width: 20px

  li.active
    color: #ededed
    border-bottom: 2px solid #ededed
"""

update: (output, domEl) ->
  values = output.split(',')
  spaces = values[0].split(' ')
  space = values[1]

  htmlString = ""
  for i in [0..spaces.length - 1]
    icon = ""
    switch spaces[i]
        when '1' then icon = "./assets/icons/code.svg"
        when '2' then icon = "./assets/icons/system-file-manager-symbolic.svg"
        when '3' then icon = "./assets/icons/firefox-symbolic.svg"
        when '5' then icon = "./assets/icons/multimedia-audio-player.svg"
        else icon = "./assets/icons/utilities-terminal-symbolic.svg"
    htmlString += "<li id=\"desktop#{spaces[i]}\"><img src=\"#{icon}\" /></li>"

  if ($(domEl).find('.currentDesktop-container').attr('data-count') != spaces.length.toString())
     $(domEl).find('.currentDesktop-container').attr('data-count', "#{spaces.length}")
     $(domEl).find('ul').html(htmlString)
     $(domEl).find("li#desktop#{space}").addClass('active')
  else
    $(domEl).find('li.active').removeClass('active')
    $(domEl).find("li#desktop#{space}").addClass('active')
