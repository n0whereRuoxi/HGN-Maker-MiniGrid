( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b160 - block
    b995 - block
    b833 - block
    b800 - block
    b921 - block
    b704 - block
    b615 - block
    b68 - block
    b216 - block
    b308 - block
    b742 - block
    b919 - block
    b352 - block
    b131 - block
    b463 - block
    b38 - block
    b387 - block
    b52 - block
    b543 - block
    b345 - block
    b795 - block
    b819 - block
    b72 - block
    b266 - block
    b255 - block
    b327 - block
    b766 - block
    b432 - block
    b320 - block
    b523 - block
    b119 - block
    b916 - block
    b799 - block
    b323 - block
    b85 - block
    b159 - block
    b585 - block
    b520 - block
    b394 - block
    b80 - block
    b449 - block
    b801 - block
    b626 - block
    b317 - block
    b840 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b160 )
    ( on b995 b160 )
    ( on b833 b995 )
    ( on b800 b833 )
    ( on b921 b800 )
    ( on b704 b921 )
    ( on b615 b704 )
    ( on b68 b615 )
    ( on b216 b68 )
    ( on b308 b216 )
    ( on b742 b308 )
    ( on b919 b742 )
    ( on b352 b919 )
    ( on b131 b352 )
    ( on b463 b131 )
    ( on b38 b463 )
    ( on b387 b38 )
    ( on b52 b387 )
    ( on b543 b52 )
    ( on b345 b543 )
    ( on b795 b345 )
    ( on b819 b795 )
    ( on b72 b819 )
    ( on b266 b72 )
    ( on b255 b266 )
    ( on b327 b255 )
    ( on b766 b327 )
    ( on b432 b766 )
    ( on b320 b432 )
    ( on b523 b320 )
    ( on b119 b523 )
    ( on b916 b119 )
    ( on b799 b916 )
    ( on b323 b799 )
    ( on b85 b323 )
    ( on b159 b85 )
    ( on b585 b159 )
    ( on b520 b585 )
    ( on b394 b520 )
    ( on b80 b394 )
    ( on b449 b80 )
    ( on b801 b449 )
    ( on b626 b801 )
    ( on b317 b626 )
    ( on b840 b317 )
    ( clear b840 )
  )
  ( :tasks
    ( Make-44Pile b995 b833 b800 b921 b704 b615 b68 b216 b308 b742 b919 b352 b131 b463 b38 b387 b52 b543 b345 b795 b819 b72 b266 b255 b327 b766 b432 b320 b523 b119 b916 b799 b323 b85 b159 b585 b520 b394 b80 b449 b801 b626 b317 b840 )
  )
)
