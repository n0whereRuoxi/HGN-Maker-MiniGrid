( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b16 - block
    b756 - block
    b751 - block
    b79 - block
    b831 - block
    b34 - block
    b602 - block
    b875 - block
    b518 - block
    b919 - block
    b615 - block
    b425 - block
    b601 - block
    b966 - block
    b117 - block
    b416 - block
    b612 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b16 )
    ( on b756 b16 )
    ( on b751 b756 )
    ( on b79 b751 )
    ( on b831 b79 )
    ( on b34 b831 )
    ( on b602 b34 )
    ( on b875 b602 )
    ( on b518 b875 )
    ( on b919 b518 )
    ( on b615 b919 )
    ( on b425 b615 )
    ( on b601 b425 )
    ( on b966 b601 )
    ( on b117 b966 )
    ( on b416 b117 )
    ( on b612 b416 )
    ( clear b612 )
  )
  ( :tasks
    ( Make-16Pile b756 b751 b79 b831 b34 b602 b875 b518 b919 b615 b425 b601 b966 b117 b416 b612 )
  )
)
