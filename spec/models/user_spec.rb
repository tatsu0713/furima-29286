require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'nickname, email, password, password_confirmation, kanji_family_name, kanji_first_name, kana_family_name, kana_first_name, birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で、半角英数字混合で存在していれば登録できる' do
        @user.password = '1a000000'
        @user.password_confirmation = '1a000000'
        expect(@user).to be_valid
      end
      it 'kanji_family_nameが全角(漢字、ひらがな、カタカナ)であれば登録できる' do
        @user.kanji_family_name = '田中'
        expect(@user).to be_valid
      end
      it 'kanji_first_nameが全角(漢字、ひらがな、カタカナ)であれば登録できる' do
        @user.kanji_first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'kana_family_nameが全角(カタカナ)であれば登録できる' do
        @user.kana_family_name = 'タナカ'
        expect(@user).to be_valid
      end
      it 'kana_first_nameが全角(カタカナ)であれば登録できる' do
        @user.kana_first_name = 'タロウ'
        expect(@user).to be_valid
      end
      it 'emailに@があれば登録できる' do
        @user.email = 'aaa@aaa'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Nicknameを入力してください')
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'emailに@が含まれてなければ登録できない' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.password = '0000000'
        @user.password_confirmation = '0000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'kanji_family_nameが空だと登録できない' do
        @user.kanji_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji family nameを入力してください')
      end
      it 'kanji_family_nameが全角(漢字、ひらがな、カタカナ)でなければ登録できない' do
        @user.kanji_family_name = "abcde123"
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji family nameは不正な値です')
      end
      it 'kanji_first_nameが空だと登録できない' do
        @user.kanji_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji first nameを入力してください')
      end
      it 'kanji_first_nameが全角(漢字、ひらがな、カタカナ)でなければ登録できない' do
        @user.kanji_first_name = "abcdef123"
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji first nameは不正な値です')
      end
      it 'kana_family_nameが空だと登録できない' do
        @user.kana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana family nameを入力してください')
      end
      it 'kana_family_nameが全角(カタカナ)でなければ登録できない' do
        @user.kana_family_name = "aadddd2222"
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana family nameは不正な値です')
      end
      it 'kana_first_nameが空だと登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first nameを入力してください')
      end
      it 'kana_first_nameが全角(カタカナ)でなければ登録できない' do
        @user.kana_first_name = "aaaa1111"
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first nameは不正な値です')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Birthdayを入力してください')
      end
    end
  end
end
