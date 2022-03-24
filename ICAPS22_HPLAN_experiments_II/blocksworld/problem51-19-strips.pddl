( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b71 - block
    b988 - block
    b879 - block
    b960 - block
    b661 - block
    b613 - block
    b212 - block
    b971 - block
    b844 - block
    b242 - block
    b689 - block
    b367 - block
    b347 - block
    b518 - block
    b158 - block
    b841 - block
    b376 - block
    b391 - block
    b968 - block
    b149 - block
    b513 - block
    b603 - block
    b495 - block
    b259 - block
    b427 - block
    b558 - block
    b106 - block
    b131 - block
    b910 - block
    b726 - block
    b238 - block
    b912 - block
    b84 - block
    b306 - block
    b759 - block
    b914 - block
    b608 - block
    b326 - block
    b808 - block
    b828 - block
    b529 - block
    b327 - block
    b742 - block
    b64 - block
    b489 - block
    b125 - block
    b410 - block
    b942 - block
    b216 - block
    b514 - block
    b263 - block
    b561 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b71 )
    ( on b988 b71 )
    ( on b879 b988 )
    ( on b960 b879 )
    ( on b661 b960 )
    ( on b613 b661 )
    ( on b212 b613 )
    ( on b971 b212 )
    ( on b844 b971 )
    ( on b242 b844 )
    ( on b689 b242 )
    ( on b367 b689 )
    ( on b347 b367 )
    ( on b518 b347 )
    ( on b158 b518 )
    ( on b841 b158 )
    ( on b376 b841 )
    ( on b391 b376 )
    ( on b968 b391 )
    ( on b149 b968 )
    ( on b513 b149 )
    ( on b603 b513 )
    ( on b495 b603 )
    ( on b259 b495 )
    ( on b427 b259 )
    ( on b558 b427 )
    ( on b106 b558 )
    ( on b131 b106 )
    ( on b910 b131 )
    ( on b726 b910 )
    ( on b238 b726 )
    ( on b912 b238 )
    ( on b84 b912 )
    ( on b306 b84 )
    ( on b759 b306 )
    ( on b914 b759 )
    ( on b608 b914 )
    ( on b326 b608 )
    ( on b808 b326 )
    ( on b828 b808 )
    ( on b529 b828 )
    ( on b327 b529 )
    ( on b742 b327 )
    ( on b64 b742 )
    ( on b489 b64 )
    ( on b125 b489 )
    ( on b410 b125 )
    ( on b942 b410 )
    ( on b216 b942 )
    ( on b514 b216 )
    ( on b263 b514 )
    ( on b561 b263 )
    ( clear b561 )
  )
  ( :goal
    ( and
      ( clear b71 )
    )
  )
)
