# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
  {id: 1, name: "basic"}
])

Content.create([
  {id: 1, title:"目標を確認しよう",path:"first",category_id: 1},
  {id: 2, title:"AWSアカウントを作成しよう",path:"account",category_id: 1},
  {id: 3, title:"セキュリティ初期設定をやってみよう",path:"first_security",category_id: 1},
  {id: 4, title:"Amazon VPCを作成してみよう",path:"vpc",category_id: 1},
  {id: 5, title:"SecurityGroupを作成してみよう",path:"securitygroup",category_id: 1},
  {id: 6, title:"EC2を作成してみよう",path:"ec2",category_id: 1},
  {id: 7, title:"RDSを作成しよう",path:"rds",category_id: 1},
  {id: 8, title:"WordPressの設定をしよう",path:"wordpress",category_id: 1},
  {id: 9, title:"ALBを作成してみよう",path:"alb",category_id: 1},
  {id: 10, title:"ドメインを取得してみよう",path:"domain",category_id: 1},
  {id: 11, title:"ホストゾーンを作成してみよう",path:"hostzone",category_id: 1},
  {id: 12, title:"今まで作成したリソースを削除しよう",path:"deleteresource",category_id: 1},
  {id: 13, title:"CloudFormationで自動構築してみよう",path:"cfn",category_id: 1}
])