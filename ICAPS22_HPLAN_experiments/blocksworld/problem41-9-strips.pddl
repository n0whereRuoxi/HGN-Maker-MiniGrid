( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b237 - block
    b314 - block
    b212 - block
    b911 - block
    b117 - block
    b327 - block
    b578 - block
    b139 - block
    b824 - block
    b306 - block
    b792 - block
    b437 - block
    b956 - block
    b170 - block
    b471 - block
    b300 - block
    b507 - block
    b351 - block
    b951 - block
    b268 - block
    b815 - block
    b308 - block
    b134 - block
    b284 - block
    b54 - block
    b736 - block
    b131 - block
    b570 - block
    b387 - block
    b247 - block
    b641 - block
    b78 - block
    b852 - block
    b596 - block
    b931 - block
    b494 - block
    b465 - block
    b776 - block
    b325 - block
    b209 - block
    b317 - block
    b69 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b237 )
    ( on b314 b237 )
    ( on b212 b314 )
    ( on b911 b212 )
    ( on b117 b911 )
    ( on b327 b117 )
    ( on b578 b327 )
    ( on b139 b578 )
    ( on b824 b139 )
    ( on b306 b824 )
    ( on b792 b306 )
    ( on b437 b792 )
    ( on b956 b437 )
    ( on b170 b956 )
    ( on b471 b170 )
    ( on b300 b471 )
    ( on b507 b300 )
    ( on b351 b507 )
    ( on b951 b351 )
    ( on b268 b951 )
    ( on b815 b268 )
    ( on b308 b815 )
    ( on b134 b308 )
    ( on b284 b134 )
    ( on b54 b284 )
    ( on b736 b54 )
    ( on b131 b736 )
    ( on b570 b131 )
    ( on b387 b570 )
    ( on b247 b387 )
    ( on b641 b247 )
    ( on b78 b641 )
    ( on b852 b78 )
    ( on b596 b852 )
    ( on b931 b596 )
    ( on b494 b931 )
    ( on b465 b494 )
    ( on b776 b465 )
    ( on b325 b776 )
    ( on b209 b325 )
    ( on b317 b209 )
    ( on b69 b317 )
    ( clear b69 )
  )
  ( :goal
    ( and
      ( clear b237 )
    )
  )
)
