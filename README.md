# openvsx_publish.bat

このスクリプトは、VS Code 拡張機能 (`.vsix` ファイル) を [Open VSX Registry](https://open-vsx.org/) に発行するプロセスを自動化します。

## 前提条件

このスクリプトを使用する前に、次のことを確認してください。

1.  **`ovsx` のインストール:** `ovsx` コマンドラインツールが必要です。インストールしていない場合は、npm を使用してインストールできます。
    ```bash
    npm install -g ovsx
    ```

2.  **`OPEN_VSX_TOKEN` 環境変数:** `OPEN_VSX_TOKEN` という名前の環境変数を Open VSX アクセストークンで設定する必要があります。[Open VSX の設定ページ](https://open-vsx.org/user/settings) でトークンを作成できます。

## 重要: 公開までの流れ（コマンドライン利用）

このバッチスクリプト (`ovsx` コマンド) を使用して**認証済み (verified)** の発行元として拡張機能を公開するには、いくつかの手動での事前準備が必要です。

### Step 1: Eclipse Foundation アカウントの準備と同意書の署名

1.  **Eclipse Foundation アカウントの作成:**
    *   [こちらのフォーム](https://accounts.eclipse.org/user/register) からアカウントを作成します。
    *   **重要:** アカウント情報には、`open-vsx.org` へのログインに使用するGitHubアカウントのユーザー名を必ず入力してください。

2.  **発行者同意書 (Publisher Agreement) への署名:**
    *   [open-vsx.org](https://open-vsx.org/) にGitHubアカウントでログインします。
    *   右上のアバターから `Settings` -> `Profile` に移動します。
    *   `Log in with Eclipse` ボタンをクリックし、作成したEclipseアカウントと連携します。
    *   正常に連携されると、`Show Publisher Agreement` ボタンが表示されます。内容を確認し、同意 (`Agree`) します。

### Step 2: 名前空間 (Namespace) の手動申請

`ovsx` コマンドでの公開には、発行元を識別するための `名前空間` が必須です。これは**手動で申請し、承認を得る必要**があります。

*   **申請方法:** [こちらのGitHubリポジトリ](https://github.com/EclipseFdn/open-vsx.org/issues) で "New issue" をクリックし、テンプレートに従って名前空間の申請を行います。
*   **承認:** 申請が承認されると、指定した名前空間が自分のアカウントに紐付けられます。

### Step 3: アクセストークンの発行と利用

*   **名前空間が承認された後**、[Open VSX の設定ページ](https://open-vsx.org/user/settings/tokens) でアクセストークンを発行します。
*   このトークンを `OPEN_VSX_TOKEN` 環境変数に設定することで、初めて `ovsx` コマンドによる操作（およびこのバッチファイルの利用）が可能になります。

## このバッチスクリプトの使い方

上記の手順がすべて完了したら、このスクリプトを使用して簡単に公開できます。

1.  `openvsx_puslish.bat` スクリプトを `.vsix` ファイルと同じディレクトリに配置します。
2.  `OPEN_VSX_TOKEN` 環境変数が設定されていることを確認してください。
3.  コマンドプロンプトからスクリプトを実行します。
    ```batch
    openvsx_puslish.bat
    ```

スクリプトは自動的にディレクトリ内で最新の `.vsix` ファイルを見つけて発行します。

---

## 補足: Webサイトからの直接アップロード

名前空間の申請やアクセストークンの設定を行わずに、[Open VSX の Web サイト](https://open-vsx.org/)から直接 `.vsix` ファイルをアップロードすることも可能です。

ただし、この方法で公開された拡張機能には、**「承認されていない発行元からのものです」という警告が表示されます。**

本格的な公開には、上記の手順を踏んで認証済み発行元となることをお勧めします。
