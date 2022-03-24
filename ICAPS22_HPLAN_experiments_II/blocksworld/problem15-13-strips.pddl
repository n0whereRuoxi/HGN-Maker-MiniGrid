( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b656 - block
    b778 - block
    b524 - block
    b370 - block
    b846 - block
    b13 - block
    b859 - block
    b928 - block
    b650 - block
    b188 - block
    b174 - block
    b996 - block
    b783 - block
    b512 - block
    b881 - block
    b226 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b656 )
    ( on b778 b656 )
    ( on b524 b778 )
    ( on b370 b524 )
    ( on b846 b370 )
    ( on b13 b846 )
    ( on b859 b13 )
    ( on b928 b859 )
    ( on b650 b928 )
    ( on b188 b650 )
    ( on b174 b188 )
    ( on b996 b174 )
    ( on b783 b996 )
    ( on b512 b783 )
    ( on b881 b512 )
    ( on b226 b881 )
    ( clear b226 )
  )
  ( :goal
    ( and
      ( clear b656 )
    )
  )
)
