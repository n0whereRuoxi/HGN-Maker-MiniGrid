( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b64 - block
    b162 - block
    b866 - block
    b871 - block
    b9 - block
    b34 - block
    b958 - block
    b352 - block
    b131 - block
    b986 - block
    b215 - block
    b646 - block
    b888 - block
    b98 - block
    b141 - block
    b840 - block
    b850 - block
    b22 - block
    b716 - block
    b411 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b64 )
    ( on b162 b64 )
    ( on b866 b162 )
    ( on b871 b866 )
    ( on b9 b871 )
    ( on b34 b9 )
    ( on b958 b34 )
    ( on b352 b958 )
    ( on b131 b352 )
    ( on b986 b131 )
    ( on b215 b986 )
    ( on b646 b215 )
    ( on b888 b646 )
    ( on b98 b888 )
    ( on b141 b98 )
    ( on b840 b141 )
    ( on b850 b840 )
    ( on b22 b850 )
    ( on b716 b22 )
    ( on b411 b716 )
    ( clear b411 )
  )
  ( :tasks
    ( Make-19Pile b162 b866 b871 b9 b34 b958 b352 b131 b986 b215 b646 b888 b98 b141 b840 b850 b22 b716 b411 )
  )
)
