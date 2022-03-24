( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b586 - block
    b437 - block
    b95 - block
    b757 - block
    b82 - block
    b567 - block
    b812 - block
    b747 - block
    b565 - block
    b404 - block
    b72 - block
    b532 - block
    b519 - block
    b840 - block
    b267 - block
    b58 - block
    b893 - block
    b144 - block
    b813 - block
    b354 - block
    b312 - block
    b855 - block
    b186 - block
    b470 - block
    b293 - block
    b236 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b586 )
    ( on b437 b586 )
    ( on b95 b437 )
    ( on b757 b95 )
    ( on b82 b757 )
    ( on b567 b82 )
    ( on b812 b567 )
    ( on b747 b812 )
    ( on b565 b747 )
    ( on b404 b565 )
    ( on b72 b404 )
    ( on b532 b72 )
    ( on b519 b532 )
    ( on b840 b519 )
    ( on b267 b840 )
    ( on b58 b267 )
    ( on b893 b58 )
    ( on b144 b893 )
    ( on b813 b144 )
    ( on b354 b813 )
    ( on b312 b354 )
    ( on b855 b312 )
    ( on b186 b855 )
    ( on b470 b186 )
    ( on b293 b470 )
    ( on b236 b293 )
    ( clear b236 )
  )
  ( :goal
    ( and
      ( clear b586 )
    )
  )
)
