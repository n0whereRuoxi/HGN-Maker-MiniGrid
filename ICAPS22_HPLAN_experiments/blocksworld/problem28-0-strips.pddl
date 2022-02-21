( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b238 - block
    b255 - block
    b586 - block
    b306 - block
    b416 - block
    b596 - block
    b151 - block
    b60 - block
    b144 - block
    b691 - block
    b444 - block
    b285 - block
    b814 - block
    b845 - block
    b231 - block
    b176 - block
    b65 - block
    b3 - block
    b821 - block
    b739 - block
    b712 - block
    b377 - block
    b394 - block
    b471 - block
    b215 - block
    b456 - block
    b116 - block
    b430 - block
    b194 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b238 )
    ( on b255 b238 )
    ( on b586 b255 )
    ( on b306 b586 )
    ( on b416 b306 )
    ( on b596 b416 )
    ( on b151 b596 )
    ( on b60 b151 )
    ( on b144 b60 )
    ( on b691 b144 )
    ( on b444 b691 )
    ( on b285 b444 )
    ( on b814 b285 )
    ( on b845 b814 )
    ( on b231 b845 )
    ( on b176 b231 )
    ( on b65 b176 )
    ( on b3 b65 )
    ( on b821 b3 )
    ( on b739 b821 )
    ( on b712 b739 )
    ( on b377 b712 )
    ( on b394 b377 )
    ( on b471 b394 )
    ( on b215 b471 )
    ( on b456 b215 )
    ( on b116 b456 )
    ( on b430 b116 )
    ( on b194 b430 )
    ( clear b194 )
  )
  ( :goal
    ( and
      ( clear b238 )
    )
  )
)
