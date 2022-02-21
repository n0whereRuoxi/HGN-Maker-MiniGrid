( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b196 - block
    b717 - block
    b301 - block
    b970 - block
    b743 - block
    b292 - block
    b476 - block
    b923 - block
    b411 - block
    b120 - block
    b222 - block
    b790 - block
    b383 - block
    b174 - block
    b748 - block
    b606 - block
    b986 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b196 )
    ( on b717 b196 )
    ( on b301 b717 )
    ( on b970 b301 )
    ( on b743 b970 )
    ( on b292 b743 )
    ( on b476 b292 )
    ( on b923 b476 )
    ( on b411 b923 )
    ( on b120 b411 )
    ( on b222 b120 )
    ( on b790 b222 )
    ( on b383 b790 )
    ( on b174 b383 )
    ( on b748 b174 )
    ( on b606 b748 )
    ( on b986 b606 )
    ( clear b986 )
  )
  ( :goal
    ( and
      ( clear b196 )
    )
  )
)
