<?php

namespace Tests\Feature;

use App\User;
use Tests\TestCase;
use Illuminate\Foundation\Testing\WithoutMiddleware;

class RegisterTest extends TestCase
{
    /** @test */
    public function can_register()
    {
        $this->postJson('/api/register', [
            'name' => 'Test User',
            'email' => 'test@polban.ac.id',
            'password' => 'secret',
            'password_confirmation' => 'secret',
        ])
        ->assertSuccessful();

        // Lihat di database, tabel users, data user yang register sudah masuk
        $this->assertDatabaseHas('users', [
            'name'  => 'Test User',
            'email' => 'test@polban.ac.id',
        ]);

        // Cek hash password yang tersimpan cocok dengan password yang diinput
        $this->assertTrue(app('hash')->check('secret', User::first()->password));
    }

    /** @test */
    public function can_not_register_with_existing_email()
    {
        factory(User::class)->create(['email' => 'test@polban.ac.id']);

        $this->postJson('/api/register', [
            'name' => 'Test User',
            'email' => 'test@polban.ac.id',
            'password' => 'secret',
            'password_confirmation' => 'secret',
        ])
        ->assertStatus(422)
        ->assertJsonValidationErrors(['email']);
    }

    /** @test */
    public function user_name_is_required()
    {
        // Submit form untuk register dengan field 'name' kosong.
        $response = $this->postJson('/api/register', [
            'name'                  => '',
            'email'                 => 'test@polban.ac.id',
            'password'              => 'secret',
            'password_confirmation' => 'secret',
        ]);

        // Cek pada session apakah ada error untuk field 'name'.
        $response->assertStatus(422);
    }

    /** @test */
    public function user_name_maximum_is_255_characters()
    {
        // Submit form untuk register dengan field 'name' 260 karakter.
        $response = $this->postJson('/api/register', [
            'name'                  => str_repeat('Test User ', 26),
            'email'                 => 'test@polban.ac.id',
            'password'              => 'secret',
            'password_confirmation' => 'secret',
        ]);

        // Cek pada session apakah ada error untuk field 'name'.
        $response->assertStatus(422);
    }

    /** @test */
    public function user_email_is_required()
    {
        // Submit form untuk register dengan field 'email' kosong.
        $response = $this->postJson('/api/register', [
            'name'                  => 'Test User',
            'email'                 => '',
            'password'              => 'secret',
            'password_confirmation' => 'secret',
        ]);

        // Cek pada session apakah ada error untuk field 'email'.
        $response->assertStatus(422);
    }

    /** @test */
    public function user_email_must_be_a_valid_email()
    {
        // Submit form untuk register dengan field 'email' tidak valid.
        $response = $this->postJson('/api/register', [
            'name'                  => 'Test User',
            'email'                 => 'test.polban.ac.id',
            'password'              => 'secret',
            'password_confirmation' => 'secret',
        ]);

        // Cek pada session apakah ada error untuk field 'email'.
        $response->assertStatus(422);
    }

    /** @test */
    public function user_email_maximum_is_255_characters()
    {
        // Submit form untuk register dengan field 'email' 260 karakter.
        $response = $this->postJson('/api/register', [
            'name'                  => 'Test User',
            'email'                 => str_repeat('test@polban.ac.id', 13),
            'password'              => 'secret',
            'password_confirmation' => 'secret',
        ]);

        // Cek pada session apakah ada error untuk field 'email'.
        $response->assertStatus(422);
    }

    /** @test */
    public function user_email_must_be_unique_on_users_table()
    {
        // Buat satu user baru
        $user = factory(User::class)->create(['email' => 'test@polban.ac.id']);

        // Submit form untuk register dengan field
        // 'email' yang sudah ada di tabel users.
        $response = $this->postJson('/api/register', [
            'name'                  => 'Test User',
            'email'                 => 'test@polban.ac.id',
            'password'              => 'secret',
            'password_confirmation' => 'secret',
        ]);

        // Cek pada session apakah ada error untuk field 'email'.
        $response->assertStatus(422);
    }

    /** @test */
    public function user_password_is_required()
    {
        // Submit form untuk register dengan field 'password' kosong.
        $response = $this->postJson('/api/register', [
            'name'                  => 'Test User',
            'email'                 => 'test@polban.ac.id',
            'password'              => '',
            'password_confirmation' => 'secret',
        ]);

        // Cek pada session apakah ada error untuk field 'password'.
        $response->assertStatus(422);
    }

    /** @test */
    public function user_password_minimum_is_6_characters()
    {
        // Submit form untuk register dengan field 'password' 5 karakter.
        $response = $this->postJson('/api/register', [
            'name'                  => 'Test User',
            'email'                 => 'test@polban.ac.id',
            'password'              => 'ecret',
            'password_confirmation' => 'ecret',
        ]);

        // Cek pada session apakah ada error untuk field 'password'.
        $response->assertStatus(422);
    }

    public function user_email_ends_with_polban_ac_id()
    {
        // Submit form untuk register dengan field 'password' 5 karakter.
        $response = $this->postJson('/api/register', [
            'name'                  => 'Test User',
            'email'                 => 'test@test.app',
            'password'              => 'secret',
            'password_confirmation' => 'secret',
        ]);

        // Cek pada session apakah ada error untuk field 'password'.
        $response->assertStatus(422);
    }
}
