# Music Player
class MusicPlayer
  attr_reader :play_state, :paused_state, :stop_state
  attr_accessor :state

  def initialize
    @play_state = PlayState.new(self)
    @paused_state = PausedState.new(self)
    @stop_state = StopState.new(self)

    @state = stop_state
    @song = 'The Winds of the west'
  end

  def view_current_state
    puts "Music Player is #{state.state_name}"
  end

  def prompt_player
    state.prompt_player(@song)
  end

  def color_change
    state.color_change
  end
end

class PlayState
  attr_reader :music_player, :state_name

  def initialize(music_player)
    @music_player = music_player
    @state_name = 'Play'
  end

  def prompt_player(song)
    "#{state_name}: #{song}"
  end

  def color_change
    puts "#{state_name}: Changing color to green"
  end

  def press_pause
    music_player.state = music_player.paused_state
  end

  def press_stop
    music_player.state = music_player.stop_state
  end
end

class PausedState
  attr_reader :music_player, :state_name

  def initialize(music_player)
    @music_player = music_player
    @state_name = 'Pause'
  end

  def prompt_player(song)
    "#{state_name}: #{song}"
  end

  def color_change
    puts "#{state_name}: Changing color to yellow"
  end

  def press_play
    music_player.state = music_player.play_state
  end

  def press_stop
    music_player.state = music_player.stop_state
  end
end

class StopState
  attr_reader :music_player, :state_name

  def initialize(music_player)
    @music_player = music_player
    @state_name = 'Stop'
  end

  def prompt_player(song)
    "#{state_name}: #{song}"
  end

  def color_change
    puts "#{state_name}: Changing color to red"
  end

  def press_play
    music_player.state = music_player.play_state
  end
end

# [Run]
music_player = MusicPlayer.new
current_state = music_player.state
current_state.press_play
music_player.view_current_state

current_state = music_player.state
current_state.press_pause
music_player.view_current_state

current_state = music_player.state
current_state.press_stop
music_player.view_current_state
