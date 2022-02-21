( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b366 - block
    b214 - block
    b512 - block
    b570 - block
    b851 - block
    b113 - block
    b840 - block
    b296 - block
    b476 - block
    b767 - block
    b665 - block
    b677 - block
    b626 - block
    b745 - block
    b377 - block
    b68 - block
    b224 - block
    b419 - block
    b246 - block
    b321 - block
    b769 - block
    b248 - block
    b257 - block
    b643 - block
    b899 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b366 )
    ( on b214 b366 )
    ( on b512 b214 )
    ( on b570 b512 )
    ( on b851 b570 )
    ( on b113 b851 )
    ( on b840 b113 )
    ( on b296 b840 )
    ( on b476 b296 )
    ( on b767 b476 )
    ( on b665 b767 )
    ( on b677 b665 )
    ( on b626 b677 )
    ( on b745 b626 )
    ( on b377 b745 )
    ( on b68 b377 )
    ( on b224 b68 )
    ( on b419 b224 )
    ( on b246 b419 )
    ( on b321 b246 )
    ( on b769 b321 )
    ( on b248 b769 )
    ( on b257 b248 )
    ( on b643 b257 )
    ( on b899 b643 )
    ( clear b899 )
  )
  ( :goal
    ( and
      ( clear b366 )
    )
  )
)
