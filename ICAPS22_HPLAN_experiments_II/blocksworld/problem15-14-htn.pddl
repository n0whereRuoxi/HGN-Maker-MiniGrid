( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b468 - block
    b172 - block
    b150 - block
    b335 - block
    b969 - block
    b413 - block
    b989 - block
    b135 - block
    b993 - block
    b90 - block
    b834 - block
    b706 - block
    b666 - block
    b896 - block
    b174 - block
    b659 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b468 )
    ( on b172 b468 )
    ( on b150 b172 )
    ( on b335 b150 )
    ( on b969 b335 )
    ( on b413 b969 )
    ( on b989 b413 )
    ( on b135 b989 )
    ( on b993 b135 )
    ( on b90 b993 )
    ( on b834 b90 )
    ( on b706 b834 )
    ( on b666 b706 )
    ( on b896 b666 )
    ( on b174 b896 )
    ( on b659 b174 )
    ( clear b659 )
  )
  ( :tasks
    ( Make-15Pile b172 b150 b335 b969 b413 b989 b135 b993 b90 b834 b706 b666 b896 b174 b659 )
  )
)
