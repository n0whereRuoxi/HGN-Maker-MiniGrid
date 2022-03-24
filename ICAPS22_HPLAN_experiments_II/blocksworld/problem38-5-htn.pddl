( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b905 - block
    b328 - block
    b268 - block
    b85 - block
    b438 - block
    b716 - block
    b446 - block
    b301 - block
    b289 - block
    b587 - block
    b571 - block
    b292 - block
    b935 - block
    b150 - block
    b865 - block
    b979 - block
    b431 - block
    b617 - block
    b870 - block
    b873 - block
    b201 - block
    b260 - block
    b625 - block
    b202 - block
    b324 - block
    b831 - block
    b63 - block
    b723 - block
    b475 - block
    b361 - block
    b969 - block
    b355 - block
    b400 - block
    b80 - block
    b747 - block
    b218 - block
    b333 - block
    b860 - block
    b597 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b905 )
    ( on b328 b905 )
    ( on b268 b328 )
    ( on b85 b268 )
    ( on b438 b85 )
    ( on b716 b438 )
    ( on b446 b716 )
    ( on b301 b446 )
    ( on b289 b301 )
    ( on b587 b289 )
    ( on b571 b587 )
    ( on b292 b571 )
    ( on b935 b292 )
    ( on b150 b935 )
    ( on b865 b150 )
    ( on b979 b865 )
    ( on b431 b979 )
    ( on b617 b431 )
    ( on b870 b617 )
    ( on b873 b870 )
    ( on b201 b873 )
    ( on b260 b201 )
    ( on b625 b260 )
    ( on b202 b625 )
    ( on b324 b202 )
    ( on b831 b324 )
    ( on b63 b831 )
    ( on b723 b63 )
    ( on b475 b723 )
    ( on b361 b475 )
    ( on b969 b361 )
    ( on b355 b969 )
    ( on b400 b355 )
    ( on b80 b400 )
    ( on b747 b80 )
    ( on b218 b747 )
    ( on b333 b218 )
    ( on b860 b333 )
    ( on b597 b860 )
    ( clear b597 )
  )
  ( :tasks
    ( Make-38Pile b328 b268 b85 b438 b716 b446 b301 b289 b587 b571 b292 b935 b150 b865 b979 b431 b617 b870 b873 b201 b260 b625 b202 b324 b831 b63 b723 b475 b361 b969 b355 b400 b80 b747 b218 b333 b860 b597 )
  )
)
