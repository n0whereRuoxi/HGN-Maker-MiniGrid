( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b181 - block
    b68 - block
    b808 - block
    b392 - block
    b775 - block
    b828 - block
    b515 - block
    b695 - block
    b431 - block
    b438 - block
    b973 - block
    b777 - block
    b723 - block
    b939 - block
    b445 - block
    b696 - block
    b358 - block
    b131 - block
    b813 - block
    b340 - block
    b815 - block
    b465 - block
    b421 - block
    b773 - block
    b348 - block
    b193 - block
    b95 - block
    b812 - block
    b704 - block
    b389 - block
    b492 - block
    b455 - block
    b992 - block
    b521 - block
    b945 - block
    b663 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b181 )
    ( on b68 b181 )
    ( on b808 b68 )
    ( on b392 b808 )
    ( on b775 b392 )
    ( on b828 b775 )
    ( on b515 b828 )
    ( on b695 b515 )
    ( on b431 b695 )
    ( on b438 b431 )
    ( on b973 b438 )
    ( on b777 b973 )
    ( on b723 b777 )
    ( on b939 b723 )
    ( on b445 b939 )
    ( on b696 b445 )
    ( on b358 b696 )
    ( on b131 b358 )
    ( on b813 b131 )
    ( on b340 b813 )
    ( on b815 b340 )
    ( on b465 b815 )
    ( on b421 b465 )
    ( on b773 b421 )
    ( on b348 b773 )
    ( on b193 b348 )
    ( on b95 b193 )
    ( on b812 b95 )
    ( on b704 b812 )
    ( on b389 b704 )
    ( on b492 b389 )
    ( on b455 b492 )
    ( on b992 b455 )
    ( on b521 b992 )
    ( on b945 b521 )
    ( on b663 b945 )
    ( clear b663 )
  )
  ( :goal
    ( and
      ( clear b181 )
    )
  )
)
