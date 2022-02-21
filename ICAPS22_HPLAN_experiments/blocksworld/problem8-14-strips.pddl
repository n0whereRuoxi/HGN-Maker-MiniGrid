( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b628 - block
    b598 - block
    b698 - block
    b925 - block
    b886 - block
    b152 - block
    b796 - block
    b955 - block
    b861 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b628 )
    ( on b598 b628 )
    ( on b698 b598 )
    ( on b925 b698 )
    ( on b886 b925 )
    ( on b152 b886 )
    ( on b796 b152 )
    ( on b955 b796 )
    ( on b861 b955 )
    ( clear b861 )
  )
  ( :goal
    ( and
      ( clear b628 )
    )
  )
)
