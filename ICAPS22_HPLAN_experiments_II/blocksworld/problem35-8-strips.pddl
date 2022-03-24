( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b531 - block
    b4 - block
    b574 - block
    b518 - block
    b21 - block
    b759 - block
    b305 - block
    b595 - block
    b158 - block
    b291 - block
    b194 - block
    b64 - block
    b196 - block
    b244 - block
    b444 - block
    b845 - block
    b904 - block
    b96 - block
    b428 - block
    b642 - block
    b745 - block
    b321 - block
    b610 - block
    b508 - block
    b608 - block
    b622 - block
    b666 - block
    b195 - block
    b698 - block
    b212 - block
    b88 - block
    b495 - block
    b116 - block
    b546 - block
    b511 - block
    b270 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b531 )
    ( on b4 b531 )
    ( on b574 b4 )
    ( on b518 b574 )
    ( on b21 b518 )
    ( on b759 b21 )
    ( on b305 b759 )
    ( on b595 b305 )
    ( on b158 b595 )
    ( on b291 b158 )
    ( on b194 b291 )
    ( on b64 b194 )
    ( on b196 b64 )
    ( on b244 b196 )
    ( on b444 b244 )
    ( on b845 b444 )
    ( on b904 b845 )
    ( on b96 b904 )
    ( on b428 b96 )
    ( on b642 b428 )
    ( on b745 b642 )
    ( on b321 b745 )
    ( on b610 b321 )
    ( on b508 b610 )
    ( on b608 b508 )
    ( on b622 b608 )
    ( on b666 b622 )
    ( on b195 b666 )
    ( on b698 b195 )
    ( on b212 b698 )
    ( on b88 b212 )
    ( on b495 b88 )
    ( on b116 b495 )
    ( on b546 b116 )
    ( on b511 b546 )
    ( on b270 b511 )
    ( clear b270 )
  )
  ( :goal
    ( and
      ( clear b531 )
    )
  )
)
