( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b541 - block
    b244 - block
    b663 - block
    b818 - block
    b9 - block
    b787 - block
    b385 - block
    b148 - block
    b666 - block
    b762 - block
    b30 - block
    b68 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b541 )
    ( on b244 b541 )
    ( on b663 b244 )
    ( on b818 b663 )
    ( on b9 b818 )
    ( on b787 b9 )
    ( on b385 b787 )
    ( on b148 b385 )
    ( on b666 b148 )
    ( on b762 b666 )
    ( on b30 b762 )
    ( on b68 b30 )
    ( clear b68 )
  )
  ( :goal
    ( and
      ( clear b541 )
    )
  )
)
