( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b45 - block
    b698 - block
    b52 - block
    b75 - block
    b378 - block
    b472 - block
    b53 - block
    b892 - block
    b333 - block
    b144 - block
    b266 - block
    b433 - block
    b513 - block
    b942 - block
    b889 - block
    b581 - block
    b141 - block
    b931 - block
    b74 - block
    b997 - block
    b710 - block
    b89 - block
    b955 - block
    b55 - block
    b345 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b45 )
    ( on b698 b45 )
    ( on b52 b698 )
    ( on b75 b52 )
    ( on b378 b75 )
    ( on b472 b378 )
    ( on b53 b472 )
    ( on b892 b53 )
    ( on b333 b892 )
    ( on b144 b333 )
    ( on b266 b144 )
    ( on b433 b266 )
    ( on b513 b433 )
    ( on b942 b513 )
    ( on b889 b942 )
    ( on b581 b889 )
    ( on b141 b581 )
    ( on b931 b141 )
    ( on b74 b931 )
    ( on b997 b74 )
    ( on b710 b997 )
    ( on b89 b710 )
    ( on b955 b89 )
    ( on b55 b955 )
    ( on b345 b55 )
    ( clear b345 )
  )
  ( :tasks
    ( Make-24Pile b698 b52 b75 b378 b472 b53 b892 b333 b144 b266 b433 b513 b942 b889 b581 b141 b931 b74 b997 b710 b89 b955 b55 b345 )
  )
)
