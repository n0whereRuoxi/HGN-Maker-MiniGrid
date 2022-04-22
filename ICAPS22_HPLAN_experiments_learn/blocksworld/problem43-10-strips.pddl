( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b819 - block
    b651 - block
    b453 - block
    b39 - block
    b239 - block
    b421 - block
    b353 - block
    b451 - block
    b507 - block
    b339 - block
    b380 - block
    b931 - block
    b770 - block
    b769 - block
    b503 - block
    b682 - block
    b84 - block
    b326 - block
    b32 - block
    b337 - block
    b905 - block
    b686 - block
    b903 - block
    b777 - block
    b495 - block
    b607 - block
    b767 - block
    b416 - block
    b868 - block
    b138 - block
    b944 - block
    b169 - block
    b852 - block
    b255 - block
    b946 - block
    b324 - block
    b566 - block
    b978 - block
    b739 - block
    b229 - block
    b660 - block
    b758 - block
    b83 - block
    b174 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b819 )
    ( on b651 b819 )
    ( on b453 b651 )
    ( on b39 b453 )
    ( on b239 b39 )
    ( on b421 b239 )
    ( on b353 b421 )
    ( on b451 b353 )
    ( on b507 b451 )
    ( on b339 b507 )
    ( on b380 b339 )
    ( on b931 b380 )
    ( on b770 b931 )
    ( on b769 b770 )
    ( on b503 b769 )
    ( on b682 b503 )
    ( on b84 b682 )
    ( on b326 b84 )
    ( on b32 b326 )
    ( on b337 b32 )
    ( on b905 b337 )
    ( on b686 b905 )
    ( on b903 b686 )
    ( on b777 b903 )
    ( on b495 b777 )
    ( on b607 b495 )
    ( on b767 b607 )
    ( on b416 b767 )
    ( on b868 b416 )
    ( on b138 b868 )
    ( on b944 b138 )
    ( on b169 b944 )
    ( on b852 b169 )
    ( on b255 b852 )
    ( on b946 b255 )
    ( on b324 b946 )
    ( on b566 b324 )
    ( on b978 b566 )
    ( on b739 b978 )
    ( on b229 b739 )
    ( on b660 b229 )
    ( on b758 b660 )
    ( on b83 b758 )
    ( on b174 b83 )
    ( clear b174 )
  )
  ( :goal
    ( and
      ( clear b819 )
    )
  )
)
