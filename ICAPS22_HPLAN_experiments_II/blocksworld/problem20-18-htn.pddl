( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b139 - block
    b984 - block
    b8 - block
    b127 - block
    b440 - block
    b403 - block
    b970 - block
    b260 - block
    b565 - block
    b283 - block
    b893 - block
    b568 - block
    b963 - block
    b544 - block
    b164 - block
    b192 - block
    b535 - block
    b332 - block
    b572 - block
    b6 - block
    b992 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b139 )
    ( on b984 b139 )
    ( on b8 b984 )
    ( on b127 b8 )
    ( on b440 b127 )
    ( on b403 b440 )
    ( on b970 b403 )
    ( on b260 b970 )
    ( on b565 b260 )
    ( on b283 b565 )
    ( on b893 b283 )
    ( on b568 b893 )
    ( on b963 b568 )
    ( on b544 b963 )
    ( on b164 b544 )
    ( on b192 b164 )
    ( on b535 b192 )
    ( on b332 b535 )
    ( on b572 b332 )
    ( on b6 b572 )
    ( on b992 b6 )
    ( clear b992 )
  )
  ( :tasks
    ( Make-20Pile b984 b8 b127 b440 b403 b970 b260 b565 b283 b893 b568 b963 b544 b164 b192 b535 b332 b572 b6 b992 )
  )
)
