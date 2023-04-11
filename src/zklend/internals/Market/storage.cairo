// SPDX-License-Identifier: BUSL-1.1

%lang starknet

from zklend.internals.Market.structs import Structs

@storage_var
func oracle() -> (oracle: felt) {
}

@storage_var
func treasury() -> (oracle: felt) {
}

// Manually expanding @storage_var so that we can read/write selected fields
// NOTE: not using member offsets (e.g. `Structs.ReserveData.enabled` for `0`) on purpose to make
// any mistake more visible.
// IMPORTANT: update this namespace whenever ReserveData is changed!!
// TODO: add test cases for all functions
namespace reserves {
    from starkware.starknet.common.storage import normalize_address
    from starkware.starknet.common.syscalls import storage_read, storage_write
    from starkware.cairo.common.cairo_builtins import HashBuiltin
    from starkware.cairo.common.hash import hash2

    func addr{pedersen_ptr: HashBuiltin*, range_check_ptr}(token: felt) -> (res: felt) {
        let res = 738337137234763042822500087055486634347765724773728104454977800082446796979;
        let (res) = hash2{hash_ptr=pedersen_ptr}(res, cast(&token, felt*)[0]);
        let (res) = normalize_address(addr=res);
        return (res=res);
    }

    func read{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(token: felt) -> (
        res: Structs.ReserveData
    ) {
        let (storage_addr) = addr(token);

        // enabled
        let (__storage_var_temp0) = storage_read(address=storage_addr + 0);
        // decimals
        let (__storage_var_temp1) = storage_read(address=storage_addr + 1);
        // z_token_address
        let (__storage_var_temp2) = storage_read(address=storage_addr + 2);
        // interest_rate_model
        let (__storage_var_temp3) = storage_read(address=storage_addr + 3);
        // collateral_factor
        let (__storage_var_temp4) = storage_read(address=storage_addr + 4);
        // borrow_factor
        let (__storage_var_temp5) = storage_read(address=storage_addr + 5);
        // reserve_factor
        let (__storage_var_temp6) = storage_read(address=storage_addr + 6);
        // last_update_timestamp
        let (__storage_var_temp7) = storage_read(address=storage_addr + 7);
        // lending_accumulator
        let (__storage_var_temp8) = storage_read(address=storage_addr + 8);
        // debt_accumulator
        let (__storage_var_temp9) = storage_read(address=storage_addr + 9);
        // current_lending_rate
        let (__storage_var_temp10) = storage_read(address=storage_addr + 10);
        // current_borrowing_rate
        let (__storage_var_temp11) = storage_read(address=storage_addr + 11);
        // raw_total_debt
        let (__storage_var_temp12) = storage_read(address=storage_addr + 12);
        // flash_loan_fee
        let (__storage_var_temp13) = storage_read(address=storage_addr + 13);
        // liquidation_bonus
        let (__storage_var_temp14) = storage_read(address=storage_addr + 14);
        // debt_limit
        let (__storage_var_temp15) = storage_read(address=storage_addr + 15);

        tempvar syscall_ptr = syscall_ptr;
        tempvar pedersen_ptr = pedersen_ptr;
        tempvar range_check_ptr = range_check_ptr;

        // enabled
        tempvar __storage_var_temp0: felt = __storage_var_temp0;
        // decimals
        tempvar __storage_var_temp1: felt = __storage_var_temp1;
        // z_token_address
        tempvar __storage_var_temp2: felt = __storage_var_temp2;
        // interest_rate_model
        tempvar __storage_var_temp3: felt = __storage_var_temp3;
        // collateral_factor
        tempvar __storage_var_temp4: felt = __storage_var_temp4;
        // borrow_factor
        tempvar __storage_var_temp5: felt = __storage_var_temp5;
        // reserve_factor
        tempvar __storage_var_temp6: felt = __storage_var_temp6;
        // last_update_timestamp
        tempvar __storage_var_temp7: felt = __storage_var_temp7;
        // lending_accumulator
        tempvar __storage_var_temp8: felt = __storage_var_temp8;
        // debt_accumulator
        tempvar __storage_var_temp9: felt = __storage_var_temp9;
        // current_lending_rate
        tempvar __storage_var_temp10: felt = __storage_var_temp10;
        // current_borrowing_rate
        tempvar __storage_var_temp11: felt = __storage_var_temp11;
        // raw_total_debt
        tempvar __storage_var_temp12: felt = __storage_var_temp12;
        // flash_loan_fee
        tempvar __storage_var_temp13: felt = __storage_var_temp13;
        // liquidation_bonus
        tempvar __storage_var_temp14: felt = __storage_var_temp14;
        // debt_limit
        tempvar __storage_var_temp15: felt = __storage_var_temp15;

        return ([cast(&__storage_var_temp0, Structs.ReserveData*)],);
    }

    func write{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
        token: felt, value: Structs.ReserveData
    ) {
        let (storage_addr) = addr(token);

        // enabled
        storage_write(address=storage_addr + 0, value=[cast(&value, felt) + 0]);
        // decimals
        storage_write(address=storage_addr + 1, value=[cast(&value, felt) + 1]);
        // z_token_address
        storage_write(address=storage_addr + 2, value=[cast(&value, felt) + 2]);
        // interest_rate_model
        storage_write(address=storage_addr + 3, value=[cast(&value, felt) + 3]);
        // collateral_factor
        storage_write(address=storage_addr + 4, value=[cast(&value, felt) + 4]);
        // borrow_factor
        storage_write(address=storage_addr + 5, value=[cast(&value, felt) + 5]);
        // reserve_factor
        storage_write(address=storage_addr + 6, value=[cast(&value, felt) + 6]);
        // last_update_timestamp
        storage_write(address=storage_addr + 7, value=[cast(&value, felt) + 7]);
        // lending_accumulator
        storage_write(address=storage_addr + 8, value=[cast(&value, felt) + 8]);
        // debt_accumulator
        storage_write(address=storage_addr + 9, value=[cast(&value, felt) + 9]);
        // current_lending_rate
        storage_write(address=storage_addr + 10, value=[cast(&value, felt) + 10]);
        // current_borrowing_rate
        storage_write(address=storage_addr + 11, value=[cast(&value, felt) + 11]);
        // raw_total_debt
        storage_write(address=storage_addr + 12, value=[cast(&value, felt) + 12]);
        // flash_loan_fee
        storage_write(address=storage_addr + 13, value=[cast(&value, felt) + 13]);
        // liquidation_bonus
        storage_write(address=storage_addr + 14, value=[cast(&value, felt) + 14]);
        // debt_limit
        storage_write(address=storage_addr + 15, value=[cast(&value, felt) + 15]);

        return ();
    }

    func read_enabled{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
        token: felt
    ) -> (enabled: felt) {
        let (storage_addr) = addr(token);

        // enabled
        let (__storage_var_temp0) = storage_read(address=storage_addr + 0);

        // TODO: check if we really need these
        tempvar syscall_ptr = syscall_ptr;
        tempvar pedersen_ptr = pedersen_ptr;
        tempvar range_check_ptr = range_check_ptr;

        return (enabled=__storage_var_temp0);
    }

    func read_decimals{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
        token: felt
    ) -> (decimals: felt) {
        let (storage_addr) = addr(token);

        // decimals
        let (__storage_var_temp1) = storage_read(address=storage_addr + 1);

        // TODO: check if we really need these
        tempvar syscall_ptr = syscall_ptr;
        tempvar pedersen_ptr = pedersen_ptr;
        tempvar range_check_ptr = range_check_ptr;

        return (decimals=__storage_var_temp1);
    }

    func read_z_token_address{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
        token: felt
    ) -> (z_token_address: felt) {
        let (storage_addr) = addr(token);

        // z_token_address
        let (__storage_var_temp2) = storage_read(address=storage_addr + 2);

        // TODO: check if we really need these
        tempvar syscall_ptr = syscall_ptr;
        tempvar pedersen_ptr = pedersen_ptr;
        tempvar range_check_ptr = range_check_ptr;

        return (z_token_address=__storage_var_temp2);
    }

    func read_borrow_factor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
        token: felt
    ) -> (borrow_factor: felt) {
        let (storage_addr) = addr(token);

        // borrow_factor
        let (__storage_var_temp5) = storage_read(address=storage_addr + 5);

        // TODO: check if we really need these
        tempvar syscall_ptr = syscall_ptr;
        tempvar pedersen_ptr = pedersen_ptr;
        tempvar range_check_ptr = range_check_ptr;

        return (borrow_factor=__storage_var_temp5);
    }

    func read_raw_total_debt{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
        token: felt
    ) -> (raw_total_debt: felt) {
        let (storage_addr) = addr(token);

        // raw_total_debt
        let (__storage_var_temp12) = storage_read(address=storage_addr + 12);

        // TODO: check if we really need these
        tempvar syscall_ptr = syscall_ptr;
        tempvar pedersen_ptr = pedersen_ptr;
        tempvar range_check_ptr = range_check_ptr;

        return (raw_total_debt=__storage_var_temp12);
    }

    func read_flash_loan_fee{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
        token: felt
    ) -> (flash_loan_fee: felt) {
        let (storage_addr) = addr(token);

        // flash_loan_fee
        let (__storage_var_temp13) = storage_read(address=storage_addr + 13);

        // TODO: check if we really need these
        tempvar syscall_ptr = syscall_ptr;
        tempvar pedersen_ptr = pedersen_ptr;
        tempvar range_check_ptr = range_check_ptr;

        return (flash_loan_fee=__storage_var_temp13);
    }

    func read_debt_limit{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
        token: felt
    ) -> (debt_limit: felt) {
        let (storage_addr) = addr(token);

        // debt_limit
        let (__storage_var_temp15) = storage_read(address=storage_addr + 15);

        // TODO: check if we really need these
        tempvar syscall_ptr = syscall_ptr;
        tempvar pedersen_ptr = pedersen_ptr;
        tempvar range_check_ptr = range_check_ptr;

        return (debt_limit=__storage_var_temp15);
    }

    func read_interest_rate_model_and_raw_total_debt{
        syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr
    }(token: felt) -> (interest_rate_model: felt, raw_total_debt: felt) {
        let (storage_addr) = addr(token);

        // interest_rate_model
        let (__storage_var_temp3) = storage_read(address=storage_addr + 3);
        // raw_total_debt
        let (__storage_var_temp12) = storage_read(address=storage_addr + 12);

        // TODO: check if we really need these
        tempvar syscall_ptr = syscall_ptr;
        tempvar pedersen_ptr = pedersen_ptr;
        tempvar range_check_ptr = range_check_ptr;

        return (interest_rate_model=__storage_var_temp3, raw_total_debt=__storage_var_temp12);
    }

    func read_for_get_user_collateral_usd_value_for_token{
        syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr
    }(token: felt) -> (decimals: felt, z_token_address: felt, collateral_factor: felt) {
        let (storage_addr) = addr(token);

        // decimals
        let (__storage_var_temp1) = storage_read(address=storage_addr + 1);
        // z_token_address
        let (__storage_var_temp2) = storage_read(address=storage_addr + 2);
        // collateral_factor
        let (__storage_var_temp4) = storage_read(address=storage_addr + 4);

        // TODO: check if we really need these
        tempvar syscall_ptr = syscall_ptr;
        tempvar pedersen_ptr = pedersen_ptr;
        tempvar range_check_ptr = range_check_ptr;

        return (
            decimals=__storage_var_temp1,
            z_token_address=__storage_var_temp2,
            collateral_factor=__storage_var_temp4,
        );
    }

    func read_for_get_lending_accumulator{
        syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr
    }(token: felt) -> (
        reserve_factor: felt,
        last_update_timestamp: felt,
        lending_accumulator: felt,
        current_lending_rate: felt,
    ) {
        let (storage_addr) = addr(token);

        // reserve_factor
        let (__storage_var_temp6) = storage_read(address=storage_addr + 6);
        // last_update_timestamp
        let (__storage_var_temp7) = storage_read(address=storage_addr + 7);
        // lending_accumulator
        let (__storage_var_temp8) = storage_read(address=storage_addr + 8);
        // current_lending_rate
        let (__storage_var_temp10) = storage_read(address=storage_addr + 10);

        // TODO: check if we really need these
        tempvar syscall_ptr = syscall_ptr;
        tempvar pedersen_ptr = pedersen_ptr;
        tempvar range_check_ptr = range_check_ptr;

        return (
            reserve_factor=__storage_var_temp6,
            last_update_timestamp=__storage_var_temp7,
            lending_accumulator=__storage_var_temp8,
            current_lending_rate=__storage_var_temp10,
        );
    }

    func read_for_get_debt_accumulator{
        syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr
    }(token: felt) -> (
        last_update_timestamp: felt, debt_accumulator: felt, current_borrowing_rate: felt
    ) {
        let (storage_addr) = addr(token);

        // last_update_timestamp
        let (__storage_var_temp7) = storage_read(address=storage_addr + 7);
        // debt_accumulator
        let (__storage_var_temp9) = storage_read(address=storage_addr + 9);
        // current_borrowing_rate
        let (__storage_var_temp11) = storage_read(address=storage_addr + 11);

        // TODO: check if we really need these
        tempvar syscall_ptr = syscall_ptr;
        tempvar pedersen_ptr = pedersen_ptr;
        tempvar range_check_ptr = range_check_ptr;

        return (
            last_update_timestamp=__storage_var_temp7,
            debt_accumulator=__storage_var_temp9,
            current_borrowing_rate=__storage_var_temp11,
        );
    }

    func read_for_get_pending_treasury_amount{
        syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr
    }(token: felt) -> (
        z_token_address: felt,
        reserve_factor: felt,
        last_update_timestamp: felt,
        lending_accumulator: felt,
        current_lending_rate: felt,
    ) {
        let (storage_addr) = addr(token);

        // z_token_address
        let (__storage_var_temp2) = storage_read(address=storage_addr + 2);
        // reserve_factor
        let (__storage_var_temp6) = storage_read(address=storage_addr + 6);
        // last_update_timestamp
        let (__storage_var_temp7) = storage_read(address=storage_addr + 7);
        // lending_accumulator
        let (__storage_var_temp8) = storage_read(address=storage_addr + 8);
        // current_lending_rate
        let (__storage_var_temp10) = storage_read(address=storage_addr + 10);

        // TODO: check if we really need these
        tempvar syscall_ptr = syscall_ptr;
        tempvar pedersen_ptr = pedersen_ptr;
        tempvar range_check_ptr = range_check_ptr;

        return (
            z_token_address=__storage_var_temp2,
            reserve_factor=__storage_var_temp6,
            last_update_timestamp=__storage_var_temp7,
            lending_accumulator=__storage_var_temp8,
            current_lending_rate=__storage_var_temp10,
        );
    }

    func read_for_settle_extra_reserve_balance{
        syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr
    }(token: felt) -> (
        z_token_address: felt,
        reserve_factor: felt,
        lending_accumulator: felt,
        debt_accumulator: felt,
        raw_total_debt: felt,
    ) {
        let (storage_addr) = addr(token);

        // z_token_address
        let (__storage_var_temp2) = storage_read(address=storage_addr + 2);
        // reserve_factor
        let (__storage_var_temp6) = storage_read(address=storage_addr + 6);
        // lending_accumulator
        let (__storage_var_temp8) = storage_read(address=storage_addr + 8);
        // debt_accumulator
        let (__storage_var_temp9) = storage_read(address=storage_addr + 9);
        // raw_total_debt
        let (__storage_var_temp12) = storage_read(address=storage_addr + 12);

        // TODO: check if we really need these
        tempvar syscall_ptr = syscall_ptr;
        tempvar pedersen_ptr = pedersen_ptr;
        tempvar range_check_ptr = range_check_ptr;

        return (
            z_token_address=__storage_var_temp2,
            reserve_factor=__storage_var_temp6,
            lending_accumulator=__storage_var_temp8,
            debt_accumulator=__storage_var_temp9,
            raw_total_debt=__storage_var_temp12,
        );
    }

    func write_lending_accumulator{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
        token: felt, value: felt
    ) {
        let (storage_addr) = addr(token);

        // lending_accumulator
        storage_write(address=storage_addr + 8, value=value);

        return ();
    }

    func write_raw_total_debt{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
        token: felt, value: felt
    ) {
        let (storage_addr) = addr(token);

        // raw_total_debt
        storage_write(address=storage_addr + 12, value=value);

        return ();
    }

    func write_debt_limit{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
        token: felt, value: felt
    ) {
        let (storage_addr) = addr(token);

        // debt_limit
        storage_write(address=storage_addr + 15, value=value);

        return ();
    }

    func write_accumulators{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
        token: felt, timestamp: felt, lending_accumulator, debt_accumulator
    ) {
        let (storage_addr) = addr(token);

        // last_update_timestamp
        storage_write(address=storage_addr + 7, value=timestamp);
        // lending_accumulator
        storage_write(address=storage_addr + 8, value=lending_accumulator);
        // debt_accumulator
        storage_write(address=storage_addr + 9, value=debt_accumulator);

        return ();
    }

    func write_rates{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
        token: felt, lending_rate: felt, borrowing_rate: felt
    ) {
        let (storage_addr) = addr(token);

        // current_lending_rate
        storage_write(address=storage_addr + 10, value=lending_rate);
        // current_borrowing_rate
        storage_write(address=storage_addr + 11, value=borrowing_rate);

        return ();
    }
}

@storage_var
func reserve_count() -> (count: felt) {
}

@storage_var
func reserve_tokens(index: felt) -> (token: felt) {
}

@storage_var
func reserve_indices(token: felt) -> (index: felt) {
}

// Bit 0: whether reserve #0 is used as collateral
// Bit 1: whether user has debt in reserve #0
// Bit 2: whether reserve #1 is used as collateral
// Bit 3: whether user has debt in reserve #1
// ...
@storage_var
func user_flags(user: felt) -> (map: felt) {
}

@storage_var
func raw_user_debts(user: felt, token: felt) -> (debt: felt) {
}
