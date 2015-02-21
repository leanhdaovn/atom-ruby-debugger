module.exports =
class RubyDebuggerView
  constructor: (serializeState, client) ->
    @client = client
    
    breakpoints = [
      "/Users/johan_lunds/Documents/Kod/apoex2/app/controllers/care/authentication_controller.rb:18"
      "/Users/johan_lunds/Documents/Kod/apoex2/app/controllers/care/authentication_controller.rb:35"
    ]
    
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('ruby-debugger')

    # Create message element
    message = document.createElement('button')
    message.textContent = "Start debugger"
    message.addEventListener 'click', => @client.startDebugger()
    # message.classList.add('message')
    @element.appendChild(message)
    
    ["info break", "start", "exit", "interrupt", "cont"].forEach (cmd) =>
      # Create message element
      message = document.createElement('button')
      message.textContent = "Run cmd: " + cmd
      message.addEventListener 'click', => @client.runCmd(cmd)
      # message.classList.add('message')
      @element.appendChild(message)

    cmd = "break"
    # Create message element
    message = document.createElement('button')
    message.textContent = "Run cmd: " + cmd
    message.addEventListener 'click', =>
      for breakpoint in breakpoints
        @client.runCmd(cmd, breakpoint)
    # message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
