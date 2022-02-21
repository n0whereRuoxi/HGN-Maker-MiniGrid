( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b126 - block
    b665 - block
    b150 - block
    b402 - block
    b658 - block
    b421 - block
    b106 - block
    b958 - block
    b788 - block
    b546 - block
    b531 - block
    b635 - block
    b368 - block
    b195 - block
    b336 - block
    b143 - block
    b742 - block
    b798 - block
    b948 - block
    b762 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b126 )
    ( on b665 b126 )
    ( on b150 b665 )
    ( on b402 b150 )
    ( on b658 b402 )
    ( on b421 b658 )
    ( on b106 b421 )
    ( on b958 b106 )
    ( on b788 b958 )
    ( on b546 b788 )
    ( on b531 b546 )
    ( on b635 b531 )
    ( on b368 b635 )
    ( on b195 b368 )
    ( on b336 b195 )
    ( on b143 b336 )
    ( on b742 b143 )
    ( on b798 b742 )
    ( on b948 b798 )
    ( on b762 b948 )
    ( clear b762 )
  )
  ( :goal
    ( and
      ( clear b126 )
    )
  )
)
