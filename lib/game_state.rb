class GameState
  def initialize
    @initialized = false
  end

  def initialized?
    @initialized
  end

  def do_initialize
    setup()
    @initialized = true
  end

  def setup
  end

  def update(tpf)
  end

  def teardown
  end
end