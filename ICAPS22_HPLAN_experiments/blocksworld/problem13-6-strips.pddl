( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b405 - block
    b621 - block
    b576 - block
    b786 - block
    b794 - block
    b175 - block
    b243 - block
    b23 - block
    b393 - block
    b62 - block
    b726 - block
    b196 - block
    b746 - block
    b873 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b405 )
    ( on b621 b405 )
    ( on b576 b621 )
    ( on b786 b576 )
    ( on b794 b786 )
    ( on b175 b794 )
    ( on b243 b175 )
    ( on b23 b243 )
    ( on b393 b23 )
    ( on b62 b393 )
    ( on b726 b62 )
    ( on b196 b726 )
    ( on b746 b196 )
    ( on b873 b746 )
    ( clear b873 )
  )
  ( :goal
    ( and
      ( clear b405 )
    )
  )
)
