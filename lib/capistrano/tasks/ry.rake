namespace :ry do
  task :validate do
    on roles(:all) do
      if fetch(:ry_ruby).nil?
        error "ry: ry_ruby is not set"
        exit 1
      end
    end
  end

  task :map_bins do
    ry_prefix = "#{fetch(:ry_exec)} #{fetch(:ry_ruby)}"

    fetch(:ry_map_bins).each do |command|
      SSHKit.config.command_map.prefix[command.to_sym].unshift(ry_prefix)
    end
  end

end

Capistrano::DSL.stages.each do |stage|
  after stage, 'ry:validate'
  after stage, 'ry:map_bins'
end

namespace :load do
  task :defaults do
    set :ry_map_bins, %w{env rake gem bundle ruby}
    set :ry_path, File.join("~", '.local')
    set :ry_exec, -> {
      "#{File.join(fetch(:ry_path), 'bin', 'ry')} exec"
    }
  end
end
