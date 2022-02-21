( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b991 - block
    b149 - block
    b272 - block
    b709 - block
    b435 - block
    b444 - block
    b472 - block
    b101 - block
    b643 - block
    b440 - block
    b236 - block
    b735 - block
    b940 - block
    b127 - block
    b587 - block
    b849 - block
    b887 - block
    b20 - block
    b91 - block
    b719 - block
    b884 - block
    b776 - block
    b688 - block
    b81 - block
    b34 - block
    b460 - block
    b314 - block
    b633 - block
    b313 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b991 )
    ( on b149 b991 )
    ( on b272 b149 )
    ( on b709 b272 )
    ( on b435 b709 )
    ( on b444 b435 )
    ( on b472 b444 )
    ( on b101 b472 )
    ( on b643 b101 )
    ( on b440 b643 )
    ( on b236 b440 )
    ( on b735 b236 )
    ( on b940 b735 )
    ( on b127 b940 )
    ( on b587 b127 )
    ( on b849 b587 )
    ( on b887 b849 )
    ( on b20 b887 )
    ( on b91 b20 )
    ( on b719 b91 )
    ( on b884 b719 )
    ( on b776 b884 )
    ( on b688 b776 )
    ( on b81 b688 )
    ( on b34 b81 )
    ( on b460 b34 )
    ( on b314 b460 )
    ( on b633 b314 )
    ( on b313 b633 )
    ( clear b313 )
  )
  ( :goal
    ( and
      ( clear b991 )
    )
  )
)
