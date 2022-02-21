( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b409 - block
    b126 - block
    b984 - block
    b193 - block
    b267 - block
    b453 - block
    b239 - block
    b303 - block
    b368 - block
    b994 - block
    b915 - block
    b816 - block
    b952 - block
    b939 - block
    b257 - block
    b237 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b409 )
    ( on b126 b409 )
    ( on b984 b126 )
    ( on b193 b984 )
    ( on b267 b193 )
    ( on b453 b267 )
    ( on b239 b453 )
    ( on b303 b239 )
    ( on b368 b303 )
    ( on b994 b368 )
    ( on b915 b994 )
    ( on b816 b915 )
    ( on b952 b816 )
    ( on b939 b952 )
    ( on b257 b939 )
    ( on b237 b257 )
    ( clear b237 )
  )
  ( :goal
    ( and
      ( clear b409 )
    )
  )
)
