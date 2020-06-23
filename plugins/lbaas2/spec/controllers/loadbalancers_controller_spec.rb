# frozen_string_literal: true

require 'spec_helper'
require_relative './factories/factories.rb'
require_relative 'shared'

describe Lbaas2::LoadbalancersController, type: :controller do
  routes { Lbaas2::Engine.routes }

  default_params = { domain_id: AuthenticationStub.domain_id,
                     project_id: AuthenticationStub.project_id }

  before(:all) do
    FriendlyIdEntry.find_or_create_entry(
      'Domain', nil, default_params[:domain_id], 'default'
    )
    FriendlyIdEntry.find_or_create_entry(
      'Project', default_params[:domain_id], default_params[:project_id],
      default_params[:project_id]
    )
  end

  describe "GET 'index'" do
    before :each do
      lbs = double('elektron', service: double("octavia", get: double("get", map_to: []) ))
      allow_any_instance_of(ServiceLayer::Lbaas2Service).to receive(:elektron).and_return(lbs)
      allow_any_instance_of(Lbaas2::LoadbalancersController).to receive(:extend_lb_data).and_return(double('lbaas').as_null_object)
    end

    it_behaves_like 'index action' do
      subject do
        @default_params = default_params
      end
    end

  end

  describe "GET 'show'" do
    before :each do
      lbs = double('elektron', service: double("octavia", get: double("get", map_to: double("lb", to_json:{})) ))
      allow_any_instance_of(ServiceLayer::Lbaas2Service).to receive(:elektron).and_return(lbs)
      allow_any_instance_of(Lbaas2::LoadbalancersController).to receive(:extend_lb_data).and_return(double('lbaas').as_null_object)
    end

    it_behaves_like 'show action' do
      subject do
        @default_params = default_params
      end
    end

  end

  describe "POST 'create'" do
    before :each do
      lbs = double('elektron', service: double("octavia", post: double("post", body: {}) ))
      allow_any_instance_of(ServiceLayer::Lbaas2Service).to receive(:elektron).and_return(lbs)
      allow_any_instance_of(Lbaas2::LoadbalancersController).to receive(:extend_lb_data).and_return(double('lbaas').as_null_object)
    end

    it_behaves_like 'post action' do
      subject do
        @default_params = default_params
        @extra_params = {loadbalancer: ::Lbaas2::FakeFactory.new.loadbalancer}
      end
    end

  end

  describe "DELETE 'destroy'" do
    before :each do
      lbs = double('elektron', service: double("octavia", delete: double("delete") ))
      allow_any_instance_of(ServiceLayer::Lbaas2Service).to receive(:elektron).and_return(lbs)
    end

    it_behaves_like 'destroy action' do
      subject do
        @default_params = default_params
        @extra_params = {id: 'lb_id'}
      end
    end

  end

  describe "GET 'status_tree'" do
    before :each do
      lbs = double('elektron', service: double("octavia", get: double("get", map_to: double("status_tree", to_json:{})) ))
      allow_any_instance_of(ServiceLayer::Lbaas2Service).to receive(:elektron).and_return(lbs)
      allow_any_instance_of(Lbaas2::LoadbalancersController).to receive(:extend_lb_data).and_return(double('lbaas').as_null_object)
    end

    it_behaves_like 'GET action with viewer context' do
      subject do
        @default_params = default_params
        @extra_params = {id: 'lb_id'}
        @path = "status_tree"
      end
    end

  end

  describe "GET 'private_networks'" do
    before :each do
      allow_any_instance_of(ServiceLayer::NetworkingService).to receive(:project_networks).and_return([])
    end

    it_behaves_like 'GET action with editor context' do
      subject do
        @default_params = default_params
        @extra_params = {id: 'lb_id'}
        @path = "private_networks"
      end
    end

  end

  describe "GET 'subnets'" do
    before :each do
      allow_any_instance_of(ServiceLayer::NetworkingService).to receive(:find_network!).and_return(double("private_network", subnet_objects: nil))
    end

    it_behaves_like 'GET action with editor context' do
      subject do
        @default_params = default_params
        @extra_params = {id: 'lb_id'}
        @path = "subnets"
      end
    end

  end

end