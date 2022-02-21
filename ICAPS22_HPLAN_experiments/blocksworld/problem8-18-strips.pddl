( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b748 - block
    b775 - block
    b321 - block
    b426 - block
    b23 - block
    b59 - block
    b752 - block
    b846 - block
    b709 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b748 )
    ( on b775 b748 )
    ( on b321 b775 )
    ( on b426 b321 )
    ( on b23 b426 )
    ( on b59 b23 )
    ( on b752 b59 )
    ( on b846 b752 )
    ( on b709 b846 )
    ( clear b709 )
  )
  ( :goal
    ( and
      ( clear b748 )
    )
  )
)
