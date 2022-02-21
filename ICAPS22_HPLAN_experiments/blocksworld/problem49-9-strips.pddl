( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b462 - block
    b672 - block
    b307 - block
    b975 - block
    b370 - block
    b254 - block
    b832 - block
    b326 - block
    b652 - block
    b577 - block
    b111 - block
    b344 - block
    b119 - block
    b84 - block
    b59 - block
    b187 - block
    b201 - block
    b657 - block
    b511 - block
    b637 - block
    b520 - block
    b924 - block
    b115 - block
    b547 - block
    b275 - block
    b107 - block
    b847 - block
    b232 - block
    b586 - block
    b159 - block
    b905 - block
    b434 - block
    b392 - block
    b478 - block
    b683 - block
    b799 - block
    b555 - block
    b106 - block
    b304 - block
    b489 - block
    b615 - block
    b244 - block
    b415 - block
    b399 - block
    b889 - block
    b416 - block
    b165 - block
    b249 - block
    b481 - block
    b180 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b462 )
    ( on b672 b462 )
    ( on b307 b672 )
    ( on b975 b307 )
    ( on b370 b975 )
    ( on b254 b370 )
    ( on b832 b254 )
    ( on b326 b832 )
    ( on b652 b326 )
    ( on b577 b652 )
    ( on b111 b577 )
    ( on b344 b111 )
    ( on b119 b344 )
    ( on b84 b119 )
    ( on b59 b84 )
    ( on b187 b59 )
    ( on b201 b187 )
    ( on b657 b201 )
    ( on b511 b657 )
    ( on b637 b511 )
    ( on b520 b637 )
    ( on b924 b520 )
    ( on b115 b924 )
    ( on b547 b115 )
    ( on b275 b547 )
    ( on b107 b275 )
    ( on b847 b107 )
    ( on b232 b847 )
    ( on b586 b232 )
    ( on b159 b586 )
    ( on b905 b159 )
    ( on b434 b905 )
    ( on b392 b434 )
    ( on b478 b392 )
    ( on b683 b478 )
    ( on b799 b683 )
    ( on b555 b799 )
    ( on b106 b555 )
    ( on b304 b106 )
    ( on b489 b304 )
    ( on b615 b489 )
    ( on b244 b615 )
    ( on b415 b244 )
    ( on b399 b415 )
    ( on b889 b399 )
    ( on b416 b889 )
    ( on b165 b416 )
    ( on b249 b165 )
    ( on b481 b249 )
    ( on b180 b481 )
    ( clear b180 )
  )
  ( :goal
    ( and
      ( clear b462 )
    )
  )
)
