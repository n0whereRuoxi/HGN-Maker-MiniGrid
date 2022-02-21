( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b976 - block
    b716 - block
    b987 - block
    b343 - block
    b697 - block
    b856 - block
    b292 - block
    b195 - block
    b742 - block
    b150 - block
    b972 - block
    b746 - block
    b135 - block
    b452 - block
    b562 - block
    b991 - block
    b514 - block
    b868 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b976 )
    ( on b716 b976 )
    ( on b987 b716 )
    ( on b343 b987 )
    ( on b697 b343 )
    ( on b856 b697 )
    ( on b292 b856 )
    ( on b195 b292 )
    ( on b742 b195 )
    ( on b150 b742 )
    ( on b972 b150 )
    ( on b746 b972 )
    ( on b135 b746 )
    ( on b452 b135 )
    ( on b562 b452 )
    ( on b991 b562 )
    ( on b514 b991 )
    ( on b868 b514 )
    ( clear b868 )
  )
  ( :goal
    ( and
      ( clear b976 )
    )
  )
)
