( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b28 - block
    b393 - block
    b102 - block
    b98 - block
    b210 - block
    b380 - block
    b408 - block
    b945 - block
    b104 - block
    b984 - block
    b199 - block
    b971 - block
    b285 - block
    b282 - block
    b258 - block
    b263 - block
    b33 - block
    b39 - block
    b277 - block
    b27 - block
    b298 - block
    b780 - block
    b551 - block
    b970 - block
    b299 - block
    b367 - block
    b214 - block
    b207 - block
    b433 - block
    b55 - block
    b936 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b28 )
    ( on b393 b28 )
    ( on b102 b393 )
    ( on b98 b102 )
    ( on b210 b98 )
    ( on b380 b210 )
    ( on b408 b380 )
    ( on b945 b408 )
    ( on b104 b945 )
    ( on b984 b104 )
    ( on b199 b984 )
    ( on b971 b199 )
    ( on b285 b971 )
    ( on b282 b285 )
    ( on b258 b282 )
    ( on b263 b258 )
    ( on b33 b263 )
    ( on b39 b33 )
    ( on b277 b39 )
    ( on b27 b277 )
    ( on b298 b27 )
    ( on b780 b298 )
    ( on b551 b780 )
    ( on b970 b551 )
    ( on b299 b970 )
    ( on b367 b299 )
    ( on b214 b367 )
    ( on b207 b214 )
    ( on b433 b207 )
    ( on b55 b433 )
    ( on b936 b55 )
    ( clear b936 )
  )
  ( :goal
    ( and
      ( clear b28 )
    )
  )
)
