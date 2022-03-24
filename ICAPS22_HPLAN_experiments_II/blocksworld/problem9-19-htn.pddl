( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b214 - block
    b134 - block
    b885 - block
    b993 - block
    b623 - block
    b97 - block
    b994 - block
    b221 - block
    b555 - block
    b998 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b214 )
    ( on b134 b214 )
    ( on b885 b134 )
    ( on b993 b885 )
    ( on b623 b993 )
    ( on b97 b623 )
    ( on b994 b97 )
    ( on b221 b994 )
    ( on b555 b221 )
    ( on b998 b555 )
    ( clear b998 )
  )
  ( :tasks
    ( Make-9Pile b134 b885 b993 b623 b97 b994 b221 b555 b998 )
  )
)
