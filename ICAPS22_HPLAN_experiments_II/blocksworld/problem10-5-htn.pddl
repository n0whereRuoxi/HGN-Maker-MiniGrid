( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b402 - block
    b978 - block
    b654 - block
    b262 - block
    b848 - block
    b150 - block
    b163 - block
    b328 - block
    b91 - block
    b519 - block
    b876 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b402 )
    ( on b978 b402 )
    ( on b654 b978 )
    ( on b262 b654 )
    ( on b848 b262 )
    ( on b150 b848 )
    ( on b163 b150 )
    ( on b328 b163 )
    ( on b91 b328 )
    ( on b519 b91 )
    ( on b876 b519 )
    ( clear b876 )
  )
  ( :tasks
    ( Make-10Pile b978 b654 b262 b848 b150 b163 b328 b91 b519 b876 )
  )
)
