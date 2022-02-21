( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b942 - block
    b284 - block
    b32 - block
    b385 - block
    b1 - block
    b806 - block
    b629 - block
    b675 - block
    b360 - block
    b419 - block
    b941 - block
    b896 - block
    b677 - block
    b890 - block
    b134 - block
    b391 - block
    b602 - block
    b703 - block
    b17 - block
    b449 - block
    b355 - block
    b61 - block
    b171 - block
    b584 - block
    b963 - block
    b183 - block
    b256 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b942 )
    ( on b284 b942 )
    ( on b32 b284 )
    ( on b385 b32 )
    ( on b1 b385 )
    ( on b806 b1 )
    ( on b629 b806 )
    ( on b675 b629 )
    ( on b360 b675 )
    ( on b419 b360 )
    ( on b941 b419 )
    ( on b896 b941 )
    ( on b677 b896 )
    ( on b890 b677 )
    ( on b134 b890 )
    ( on b391 b134 )
    ( on b602 b391 )
    ( on b703 b602 )
    ( on b17 b703 )
    ( on b449 b17 )
    ( on b355 b449 )
    ( on b61 b355 )
    ( on b171 b61 )
    ( on b584 b171 )
    ( on b963 b584 )
    ( on b183 b963 )
    ( on b256 b183 )
    ( clear b256 )
  )
  ( :goal
    ( and
      ( clear b942 )
    )
  )
)
