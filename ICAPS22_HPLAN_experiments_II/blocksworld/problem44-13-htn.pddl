( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b418 - block
    b127 - block
    b790 - block
    b586 - block
    b186 - block
    b69 - block
    b123 - block
    b406 - block
    b517 - block
    b507 - block
    b638 - block
    b144 - block
    b349 - block
    b741 - block
    b777 - block
    b479 - block
    b725 - block
    b55 - block
    b554 - block
    b103 - block
    b683 - block
    b370 - block
    b175 - block
    b675 - block
    b849 - block
    b607 - block
    b771 - block
    b684 - block
    b811 - block
    b142 - block
    b879 - block
    b308 - block
    b65 - block
    b536 - block
    b650 - block
    b442 - block
    b146 - block
    b727 - block
    b194 - block
    b2 - block
    b805 - block
    b210 - block
    b555 - block
    b606 - block
    b273 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b418 )
    ( on b127 b418 )
    ( on b790 b127 )
    ( on b586 b790 )
    ( on b186 b586 )
    ( on b69 b186 )
    ( on b123 b69 )
    ( on b406 b123 )
    ( on b517 b406 )
    ( on b507 b517 )
    ( on b638 b507 )
    ( on b144 b638 )
    ( on b349 b144 )
    ( on b741 b349 )
    ( on b777 b741 )
    ( on b479 b777 )
    ( on b725 b479 )
    ( on b55 b725 )
    ( on b554 b55 )
    ( on b103 b554 )
    ( on b683 b103 )
    ( on b370 b683 )
    ( on b175 b370 )
    ( on b675 b175 )
    ( on b849 b675 )
    ( on b607 b849 )
    ( on b771 b607 )
    ( on b684 b771 )
    ( on b811 b684 )
    ( on b142 b811 )
    ( on b879 b142 )
    ( on b308 b879 )
    ( on b65 b308 )
    ( on b536 b65 )
    ( on b650 b536 )
    ( on b442 b650 )
    ( on b146 b442 )
    ( on b727 b146 )
    ( on b194 b727 )
    ( on b2 b194 )
    ( on b805 b2 )
    ( on b210 b805 )
    ( on b555 b210 )
    ( on b606 b555 )
    ( on b273 b606 )
    ( clear b273 )
  )
  ( :tasks
    ( Make-44Pile b127 b790 b586 b186 b69 b123 b406 b517 b507 b638 b144 b349 b741 b777 b479 b725 b55 b554 b103 b683 b370 b175 b675 b849 b607 b771 b684 b811 b142 b879 b308 b65 b536 b650 b442 b146 b727 b194 b2 b805 b210 b555 b606 b273 )
  )
)
