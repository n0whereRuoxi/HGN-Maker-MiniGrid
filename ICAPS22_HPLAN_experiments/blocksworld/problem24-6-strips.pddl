( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b97 - block
    b185 - block
    b278 - block
    b171 - block
    b241 - block
    b332 - block
    b521 - block
    b243 - block
    b890 - block
    b401 - block
    b603 - block
    b781 - block
    b538 - block
    b641 - block
    b978 - block
    b893 - block
    b828 - block
    b836 - block
    b116 - block
    b490 - block
    b284 - block
    b22 - block
    b447 - block
    b217 - block
    b408 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b97 )
    ( on b185 b97 )
    ( on b278 b185 )
    ( on b171 b278 )
    ( on b241 b171 )
    ( on b332 b241 )
    ( on b521 b332 )
    ( on b243 b521 )
    ( on b890 b243 )
    ( on b401 b890 )
    ( on b603 b401 )
    ( on b781 b603 )
    ( on b538 b781 )
    ( on b641 b538 )
    ( on b978 b641 )
    ( on b893 b978 )
    ( on b828 b893 )
    ( on b836 b828 )
    ( on b116 b836 )
    ( on b490 b116 )
    ( on b284 b490 )
    ( on b22 b284 )
    ( on b447 b22 )
    ( on b217 b447 )
    ( on b408 b217 )
    ( clear b408 )
  )
  ( :goal
    ( and
      ( clear b97 )
    )
  )
)
