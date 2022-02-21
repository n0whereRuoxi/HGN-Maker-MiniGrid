( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b918 - block
    b59 - block
    b111 - block
    b994 - block
    b131 - block
    b957 - block
    b546 - block
    b573 - block
    b306 - block
    b890 - block
    b177 - block
    b144 - block
    b574 - block
    b280 - block
    b24 - block
    b120 - block
    b816 - block
    b916 - block
    b170 - block
    b115 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b918 )
    ( on b59 b918 )
    ( on b111 b59 )
    ( on b994 b111 )
    ( on b131 b994 )
    ( on b957 b131 )
    ( on b546 b957 )
    ( on b573 b546 )
    ( on b306 b573 )
    ( on b890 b306 )
    ( on b177 b890 )
    ( on b144 b177 )
    ( on b574 b144 )
    ( on b280 b574 )
    ( on b24 b280 )
    ( on b120 b24 )
    ( on b816 b120 )
    ( on b916 b816 )
    ( on b170 b916 )
    ( on b115 b170 )
    ( clear b115 )
  )
  ( :goal
    ( and
      ( clear b918 )
    )
  )
)
