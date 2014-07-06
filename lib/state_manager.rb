class StateManager
  def initialize
    @states = []
  end

  def << state
    @states << state
    self
  end

  def update(tpf)
    @states.each do |state|
      state.do_initialize unless state.initialized?
      state.update(tpf)
    end
  end
end