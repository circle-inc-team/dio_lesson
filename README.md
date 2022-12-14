# エンドポイント

## トークン

```
---------------------------------

Loginエンドポイント
post
url: auth/jwt/create
data : {
  username: String,
  password: String,
}
レスポンス
access: String
refresh: String

---------------------------------

Refreshエンドポイント
post
url: auth/jwt/refresh
data : {
  refresh: String,
}
レスポンス
access: String

---------------------------------
```

## Todo

```
accessToken必要
ヘッダー
{
  'Authorization': 'Bearer $accessToken',
}
---------------------------------

Todo一覧取得エンドポイント
get
url: api/todos
レスポンス
access: String
refresh: String

---------------------------------

Todo作成エンドポイント
post
url: api/todo/create
data : {
  text: String,
}
レスポンス
id: String
text: String
isDone: String

---------------------------------

Todo削除エンドポイント
post
url: api/todo/delete
data : {
  id: String,
}
レスポンス
200

---------------------------------

TodoTggleエンドポイント
post
url: api/todo/update_is_done
data : {
  id: String,
}
レスポンス
200

---------------------------------
```
