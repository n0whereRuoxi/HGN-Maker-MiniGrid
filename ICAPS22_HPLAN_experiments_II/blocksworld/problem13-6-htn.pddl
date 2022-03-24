( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b161 - block
    b26 - block
    b199 - block
    b711 - block
    b295 - block
    b642 - block
    b253 - block
    b395 - block
    b456 - block
    b967 - block
    b418 - block
    b805 - block
    b569 - block
    b838 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b161 )
    ( on b26 b161 )
    ( on b199 b26 )
    ( on b711 b199 )
    ( on b295 b711 )
    ( on b642 b295 )
    ( on b253 b642 )
    ( on b395 b253 )
    ( on b456 b395 )
    ( on b967 b456 )
    ( on b418 b967 )
    ( on b805 b418 )
    ( on b569 b805 )
    ( on b838 b569 )
    ( clear b838 )
  )
  ( :tasks
    ( Make-13Pile b26 b199 b711 b295 b642 b253 b395 b456 b967 b418 b805 b569 b838 )
  )
)
