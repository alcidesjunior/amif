require 'test_helper'

class AtletaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atletum = atleta(:one)
  end

  test "should get index" do
    get atleta_url
    assert_response :success
  end

  test "should get new" do
    get new_atletum_url
    assert_response :success
  end

  test "should create atletum" do
    assert_difference('Atletum.count') do
      post atleta_url, params: { atletum: { data_nascimento: @atletum.data_nascimento, email: @atletum.email, nacionalidade: @atletum.nacionalidade, nome: @atletum.nome, sexo: @atletum.sexo, sobrenome: @atletum.sobrenome } }
    end

    assert_redirected_to atletum_url(Atletum.last)
  end

  test "should show atletum" do
    get atletum_url(@atletum)
    assert_response :success
  end

  test "should get edit" do
    get edit_atletum_url(@atletum)
    assert_response :success
  end

  test "should update atletum" do
    patch atletum_url(@atletum), params: { atletum: { data_nascimento: @atletum.data_nascimento, email: @atletum.email, nacionalidade: @atletum.nacionalidade, nome: @atletum.nome, sexo: @atletum.sexo, sobrenome: @atletum.sobrenome } }
    assert_redirected_to atletum_url(@atletum)
  end

  test "should destroy atletum" do
    assert_difference('Atletum.count', -1) do
      delete atletum_url(@atletum)
    end

    assert_redirected_to atleta_url
  end
end
