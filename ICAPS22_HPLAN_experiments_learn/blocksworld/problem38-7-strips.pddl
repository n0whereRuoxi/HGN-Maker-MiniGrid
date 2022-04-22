( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b314 - block
    b326 - block
    b95 - block
    b368 - block
    b360 - block
    b760 - block
    b282 - block
    b577 - block
    b852 - block
    b201 - block
    b218 - block
    b109 - block
    b92 - block
    b78 - block
    b773 - block
    b652 - block
    b194 - block
    b273 - block
    b420 - block
    b834 - block
    b204 - block
    b138 - block
    b887 - block
    b792 - block
    b409 - block
    b223 - block
    b141 - block
    b602 - block
    b8 - block
    b956 - block
    b923 - block
    b890 - block
    b734 - block
    b104 - block
    b492 - block
    b663 - block
    b616 - block
    b697 - block
    b778 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b314 )
    ( on b326 b314 )
    ( on b95 b326 )
    ( on b368 b95 )
    ( on b360 b368 )
    ( on b760 b360 )
    ( on b282 b760 )
    ( on b577 b282 )
    ( on b852 b577 )
    ( on b201 b852 )
    ( on b218 b201 )
    ( on b109 b218 )
    ( on b92 b109 )
    ( on b78 b92 )
    ( on b773 b78 )
    ( on b652 b773 )
    ( on b194 b652 )
    ( on b273 b194 )
    ( on b420 b273 )
    ( on b834 b420 )
    ( on b204 b834 )
    ( on b138 b204 )
    ( on b887 b138 )
    ( on b792 b887 )
    ( on b409 b792 )
    ( on b223 b409 )
    ( on b141 b223 )
    ( on b602 b141 )
    ( on b8 b602 )
    ( on b956 b8 )
    ( on b923 b956 )
    ( on b890 b923 )
    ( on b734 b890 )
    ( on b104 b734 )
    ( on b492 b104 )
    ( on b663 b492 )
    ( on b616 b663 )
    ( on b697 b616 )
    ( on b778 b697 )
    ( clear b778 )
  )
  ( :goal
    ( and
      ( clear b314 )
    )
  )
)
