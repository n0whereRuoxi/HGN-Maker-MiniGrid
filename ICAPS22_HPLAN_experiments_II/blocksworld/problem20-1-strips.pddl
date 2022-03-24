( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b734 - block
    b981 - block
    b855 - block
    b613 - block
    b287 - block
    b768 - block
    b972 - block
    b138 - block
    b408 - block
    b129 - block
    b559 - block
    b16 - block
    b445 - block
    b753 - block
    b542 - block
    b161 - block
    b670 - block
    b398 - block
    b344 - block
    b371 - block
    b446 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b734 )
    ( on b981 b734 )
    ( on b855 b981 )
    ( on b613 b855 )
    ( on b287 b613 )
    ( on b768 b287 )
    ( on b972 b768 )
    ( on b138 b972 )
    ( on b408 b138 )
    ( on b129 b408 )
    ( on b559 b129 )
    ( on b16 b559 )
    ( on b445 b16 )
    ( on b753 b445 )
    ( on b542 b753 )
    ( on b161 b542 )
    ( on b670 b161 )
    ( on b398 b670 )
    ( on b344 b398 )
    ( on b371 b344 )
    ( on b446 b371 )
    ( clear b446 )
  )
  ( :goal
    ( and
      ( clear b734 )
    )
  )
)
