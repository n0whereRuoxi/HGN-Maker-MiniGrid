( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b69 - block
    b211 - block
    b703 - block
    b53 - block
    b907 - block
    b48 - block
    b332 - block
    b818 - block
    b134 - block
    b890 - block
    b943 - block
    b135 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b69 )
    ( on b211 b69 )
    ( on b703 b211 )
    ( on b53 b703 )
    ( on b907 b53 )
    ( on b48 b907 )
    ( on b332 b48 )
    ( on b818 b332 )
    ( on b134 b818 )
    ( on b890 b134 )
    ( on b943 b890 )
    ( on b135 b943 )
    ( clear b135 )
  )
  ( :goal
    ( and
      ( clear b69 )
    )
  )
)
