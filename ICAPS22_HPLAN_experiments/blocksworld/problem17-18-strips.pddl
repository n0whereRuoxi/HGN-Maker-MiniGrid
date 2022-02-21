( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b905 - block
    b686 - block
    b69 - block
    b106 - block
    b196 - block
    b775 - block
    b183 - block
    b415 - block
    b141 - block
    b468 - block
    b372 - block
    b772 - block
    b839 - block
    b522 - block
    b605 - block
    b156 - block
    b4 - block
    b821 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b905 )
    ( on b686 b905 )
    ( on b69 b686 )
    ( on b106 b69 )
    ( on b196 b106 )
    ( on b775 b196 )
    ( on b183 b775 )
    ( on b415 b183 )
    ( on b141 b415 )
    ( on b468 b141 )
    ( on b372 b468 )
    ( on b772 b372 )
    ( on b839 b772 )
    ( on b522 b839 )
    ( on b605 b522 )
    ( on b156 b605 )
    ( on b4 b156 )
    ( on b821 b4 )
    ( clear b821 )
  )
  ( :goal
    ( and
      ( clear b905 )
    )
  )
)
